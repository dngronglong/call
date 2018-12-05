package com.user.call.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StrUtil {
    public static boolean isContainChinese(String str) {
        Pattern p = Pattern.compile("[一-龥]");
        Matcher m = p.matcher(str);
        if (m.find()) {
            return true;
        }
        return false;
    }
}
