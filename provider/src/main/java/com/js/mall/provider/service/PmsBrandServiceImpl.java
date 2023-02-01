package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.js.api.model.PmsBrand;
import com.js.api.model.PmsBrandExample;
import com.js.api.service.IPmsBrandService;
import com.js.api.service.IPmsProductService;
import com.js.common.CommonPage;
import com.js.mall.provider.mapper.PmsBrandMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * @author js
 * @date 2022/12/2 18:52
 */
@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.IPmsBrandService",
        interfaceClass = IPmsBrandService.class
)
public class PmsBrandServiceImpl implements IPmsBrandService {

    @Autowired
    private PmsBrandMapper brandMapper;


    //spring EL语法，结果为空时才执行以下操作
    @Cacheable(cacheNames = {"BrandList"},unless = "#result==null",
            key="#keyword!=null?#keyword+'-'+#pageNum+'-'+#pageSize:#pageNum+'-'+#pageSize"
    )
    @Override
    public CommonPage listBrand(String keyword, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);

        PmsBrandExample pmsBrandExample=new PmsBrandExample();
        pmsBrandExample.setOrderByClause("sort desc");
        PmsBrandExample.Criteria criteria=pmsBrandExample.createCriteria();
        if(!ObjectUtils.isEmpty(keyword)){
            criteria.andNameLike("%"+keyword+"%");
        }

        List<PmsBrand> brandList=brandMapper.selectByExample(pmsBrandExample);


        return CommonPage.restPage(brandList);
    }
}
