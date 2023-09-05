
package com.wdn.utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.xml.bind.DatatypeConverter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Util {

    private static final Logger logger = LoggerFactory.getLogger(Md5Util.class);

    /**
     * Encode string.
     *
     * @param pwd the pwd
     * @return the string
     */
    public static String encode(String pwd) {
        String hash = null;
        try {
            hash = DatatypeConverter.printHexBinary(
                    MessageDigest.getInstance("MD5").digest(pwd.getBytes("UTF-8")));
        } catch (NoSuchAlgorithmException e) {
            logger.error(e.getMessage(), e);
        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage(), e);
        }
        return hash;
    }
}
