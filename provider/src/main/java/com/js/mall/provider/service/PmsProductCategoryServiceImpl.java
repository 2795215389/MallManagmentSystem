package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.js.api.model.PmsProductCategory;
import com.js.api.model.PmsProductCategoryExample;
import com.js.api.service.IPmsBrandService;
import com.js.api.service.IPmsProductCategoryService;
import com.js.common.CommonPage;
import com.js.mall.provider.mapper.PmsProductCategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;


@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.IPmsProductCategoryService",
        interfaceClass = IPmsProductCategoryService.class
)
public class PmsProductCategoryServiceImpl implements IPmsProductCategoryService {

    @Autowired
    private PmsProductCategoryMapper categoryMapper;

    @Cacheable(cacheNames = {"ProductCategoryList"},unless = "#result==null",
    key="#parentId+'-'+#pageNum+'-'+#pageSize")
    @Override
    public CommonPage getList(Long parentId, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        PmsProductCategoryExample example=new PmsProductCategoryExample();
        example.setOrderByClause("sort desc");

        example.createCriteria().andParentIdEqualTo(parentId);
        List<PmsProductCategory> list=categoryMapper.selectByExample(example);
        return CommonPage.restPage(list);
    }

    @Cacheable(cacheNames = {"ProductCategoryList"},unless = "#result==null")
    @Override
    public List<PmsProductCategory> listWithChildren() {

        return categoryMapper.listWithChildren();
    }
}
