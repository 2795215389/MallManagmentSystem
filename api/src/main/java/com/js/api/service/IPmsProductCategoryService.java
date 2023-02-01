package com.js.api.service;

import com.js.api.model.PmsProductCategory;
import com.js.common.CommonPage;

import java.util.List;

public interface IPmsProductCategoryService {
    CommonPage getList(Long parentId, Integer pageSize, Integer pageNum);
    List<PmsProductCategory> listWithChildren();
}
