package com.js.api.service;

import com.js.common.CommonPage;

public interface IPmsBrandService {
    CommonPage listBrand(String keyword, int pageNum, int pageSize);
}
