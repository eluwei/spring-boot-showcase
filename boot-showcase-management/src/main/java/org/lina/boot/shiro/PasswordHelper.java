package org.lina.boot.shiro;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.lina.boot.model.AdminUser;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-29
 * Time: 12:33
 */
@Service
public class PasswordHelper {

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();


    private String algorithmName = "md5";

    private int hashIterations = 2;

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }

    public void encryptPassword(AdminUser user) {

        user.setSalt(randomNumberGenerator.nextBytes().toHex());

        String newPassword = new SimpleHash(
                algorithmName,
                user.getPassword(),
                ByteSource.Util.bytes(user.getCredentialsSalt()),
                hashIterations).toHex();

        user.setPassword(newPassword);
    }

    public static void main(String[] args) {
        AdminUser admin=new AdminUser();
        admin.setUserName("admin");
        admin.setPassword("admin");
        PasswordHelper ph=new PasswordHelper();
        ph.encryptPassword(admin);
        System.out.println("用户名::密码::盐");
        System.out.println(""+admin.getUserName()+"::"+admin.getPassword()+"::"+admin.getSalt());
    }
}
