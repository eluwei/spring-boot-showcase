package org.lina.boot.web.controller;


import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;



@Controller
public class KaptchaImageController {
    
	@Autowired
    private Producer kaptchaProducer = null;

    @RequestMapping("/kaptchaImage")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        response.setDateHeader("Expires", 0);
        // 设置标准的 HTTP/1.1 no-cache 头
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // 设置IE扩展 HTTP/1.1 no-cache 头
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // 设置标准HTTP/1.0 no-cache 头.
        response.setHeader("Pragma", "no-cache");
        // 图片格式image/jpeg
        response.setContentType("image/jpeg");
        //用Kaptcha生成器产生一个文本字符串
        String capText = kaptchaProducer.createText();
        // 将文本字符串内容存入session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        //创建含文本的图片
        BufferedImage bi = kaptchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        // 画出此图片并展示到页面上（request.getOutputStream)
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

}
