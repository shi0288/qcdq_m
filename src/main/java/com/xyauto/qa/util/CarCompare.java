package com.xyauto.qa.util;



import com.alibaba.fastjson.JSONObject;

import java.util.Comparator;

/**
 * Created by shiqm on 2017-05-23.
 */
public class CarCompare implements Comparator<JSONObject>{

        @Override
        public int compare(JSONObject x, JSONObject y) {
            int a=x.getInteger("caryear");
            int b=y.getInteger("caryear");
            if(a<b){
                return 1;
            }else if(a>b){
                return -1;
            }
            return 0;
        }
}
