package com.catchme.util;
import java.security.MessageDigest;
import java.security.MessageDigestSpi;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {
	public static String hashPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[]hashBytes = md.digest(password.getBytes());
			
			StringBuilder sb = new StringBuilder();
			for(byte b : hashBytes) {
				sb.append(String.format("%02x", b));
				
			}
			return sb.toString();
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static boolean checkPassword(String rawPassword, String hashedPassword) {
        String hashedInput = hashPassword(rawPassword);
        return hashedInput != null && hashedInput.equals(hashedPassword);
    }

}
