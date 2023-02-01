package com.js.api.service;

import com.js.common.CommonPage;

/**
 * 创建人：Jason
 * 创建时间：2020/2/7
 * 描述你的类：UserView统计
 */
public interface IUserViewService {




    CommonPage listUV(String start, String end, String type) ;

    CommonPage listTypeUV() throws Exception;
}
