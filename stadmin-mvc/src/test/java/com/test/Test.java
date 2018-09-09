package com.test;

import com.framework.core.utils.crypto.CipherUtil;

public class Test {
    public static void main(String[] args) {
        String salt = CipherUtil.gnerateSaltBase64();
        String pwd = CipherUtil.sha256Hash2Hex("7c4a8d09ca3762af61e59520943dc26494f8941b", salt);
        System.out.println(salt);
        System.out.println(pwd);

        String hashPwd=CipherUtil.sha256Hash2Hex( "7c4a8d09ca3762af61e59520943dc26494f8941b",  "JdNWgfdOI+M7tYgAuKtc0HD9ilSnnjSonOxGPqPXdSM=");
        System.out.println(hashPwd);
    }
}
