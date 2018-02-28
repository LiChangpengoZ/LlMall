package util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

/**
 * 验证码的工具类
 * @author 李昌鹏
 */
public class AuthCode {

	private static Random    r             = new Random();
    private static char[]    chs           = "0123456789".toCharArray();
    private static final int NUMBER_OF_CHS = 4;
    private static final int IMG_WIDTH     = 90;
    private static final int IMG_HEIGHT    = 35;
	
	/**
	 * 获取验证码的方法
	 * @param request 请求参数，用来把图片的string存到session中
	 * @return 图片
	 */
	public static BufferedImage getAuchCodeImg(HttpServletRequest request) {
	
		 BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB); // 实例化BufferedImage
	        Graphics2D g = (Graphics2D) image.getGraphics();
	        Color c = new Color(255, 255, 255); // 验证码图片的背景颜色
	        g.setColor(c);
	        g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT); // 图片的边框
	        // 设定字体
	        g.setFont(new Font("Arial Black", Font.PLAIN, 24));

	        StringBuffer sb = new StringBuffer(); // 用于保存验证码字符串
	        int index; // 数组的下标
	        for (int i = 0; i < NUMBER_OF_CHS; i++) {
	            index = r.nextInt(chs.length); // 随机一个下标
	            g.setColor(new Color(r.nextInt(88), r.nextInt(210), r.nextInt(150))); // 随机一个颜色
	            g.drawString(chs[index] + "", 23 * i + 3, 18); // 画出字符
	            sb.append(chs[index]); // 验证码字符串
	        }
	        request.getSession().setAttribute("authCode", sb.toString()); // 将验证码字符串保存到session中
	        return image;
	        
	}
}
