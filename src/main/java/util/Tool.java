package util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义的工具类
 * @author 李昌鹏
 */
public class Tool {

	/**
	 * 获取当前时间，格式:yyyy-MM-dd HH:mm:ss
	 * @return String类型
	 */
	public static String getDateTime() {
		String dateTime;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateTime= sdf.format(date);
		return dateTime;
		
	}
	
	/**
	 * 获取当前时间，格式yyyyMMddHHmmss
	 * @return  返回值String类型
	 */
	public static String getDateTimeNoLine() {
		String dateTime;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		dateTime= sdf.format(date);
		return dateTime;
		
	} 
	
	/**
	 * 判空的方法
	 * @param str
	 * @return 字符串
	 */
	public static String isNull(String str) {
		if(str==null) {
			return "";
		}else {
			return str;
		}
	}
	
	/**
	 * bigdecimal和int类型的相乘返回一个字符串
	 * @param a 字符串
	 * @param b integer
	 * @return string
	 */
	public static String bigDecimalMath(String a,Integer b) {
		if(a==null|| "".equals(a)) {
			return "";
		}
		if(b==null) {
			return "";
		}
		BigDecimal bd=new BigDecimal(a);
		bd.setScale(2,BigDecimal.ROUND_HALF_EVEN);
		BigDecimal bd2=new BigDecimal(b);
		String re= bd.multiply(bd2).toString();
		return re;
	}
	
}
