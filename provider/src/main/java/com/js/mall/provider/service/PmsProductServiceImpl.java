package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.js.api.dto.PmsProductQueryParam;
import com.js.api.model.PmsProductExample;
import com.js.api.service.IPmsProductService;
import com.js.api.service.ITokenService;
import com.js.common.CommonPage;
import com.js.mall.provider.mapper.PmsProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.List;


@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.IPmsProductService",
        interfaceClass = IPmsProductService.class
)
public class PmsProductServiceImpl implements IPmsProductService {

    @Autowired
    private PmsProductMapper productMapper;


    @Cacheable(cacheNames = {"ProductList"},unless = "#result==null",
            key="T(String).valueOf(#pageNum+'-'+#pageSize)"+
                    ".concat(#productQueryParam.keyword!=null?#productQueryParam.keyword:'k')"+
                    ".concat(#productQueryParam.verifyStatus!=null?#productQueryParam.verifyStatus:'vs')"+
                    ".concat(#productQueryParam.publishStatus!=null?#productQueryParam.publishStatus:'ps')"+
                    ".concat(#productQueryParam.productSn!=null?#productQueryParam.productSn:'pn')"+
                    ".concat(#productQueryParam.brandId!=null?#productQueryParam.brandId:'bi')"+
                    ".concat(#productQueryParam.productCategoryId!=null?#productQueryParam.productCategoryId:'ci')"
    )
    @Override
    public CommonPage list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        PmsProductExample productExample=new PmsProductExample();
        PmsProductExample.Criteria criteria=productExample.createCriteria();

        //状态为0代表未删除，状态有效
        criteria.andDeleteStatusEqualTo(0);
        if(productQueryParam.getPublishStatus()!=null){
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }
        if(productQueryParam.getVerifyStatus()!=null){
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }
        //关键字模糊查询
        if(!ObjectUtils.isEmpty(productQueryParam.getKeyword())){
            criteria.andNameLike("%"+productQueryParam.getKeyword()+"%");
        }
        if(!ObjectUtils.isEmpty(productQueryParam.getProductSn())){
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }
        if(productQueryParam.getBrandId()!=null){
            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
        }
        if(productQueryParam.getProductCategoryId()!=null){
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }

        List list=productMapper.selectByExample(productExample);

        return CommonPage.restPage(list);
    }
}
