package annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 注释
 * @author 李昌鹏
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
@Inherited
public @interface Auth {

	/**
	 * 验证是否登录	true 验证	false 不验证
	 * @return
	 */
	public boolean verifyLogin() default true;
	
	/**
	 * 验证是否有权限 true 验证	false 不验证
	 * @return
	 */
	public boolean verifyURL() default true;
	
}
