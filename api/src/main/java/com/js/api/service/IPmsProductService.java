package com.js.api.service;

import com.js.api.dto.PmsProductQueryParam;
import com.js.common.CommonPage;

public interface IPmsProductService {

    /**
     * 分页查询商品
     */
    CommonPage list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum);

}
