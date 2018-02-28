package init;

import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import util.Constants;


/**
 * 初始化的servlet
 * @author 李昌鹏
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/** 
	 * 初始化的方法
	 *@param 
	 */
	public void init(ServletConfig config) throws ServletException {
		 ResourceBundle prop = ResourceBundle.getBundle("prop");
		 Constants.SEX_M=Integer.valueOf(prop.getString("SEX_M"));
		 Constants.SEX_F=Integer.valueOf(prop.getString("SEX_F"));
		 Constants.ADMIN_Y=Integer.valueOf(prop.getString("ADMIN_Y"));
		 Constants.ADMIN_N=Integer.valueOf(prop.getString("ADMIN_N"));
		 Constants.DELETE_Y=Integer.valueOf(prop.getString("DELETE_Y"));
		 Constants.DELETE_N=Integer.valueOf(prop.getString("DELETE_N"));
		 Constants.EFFECT_Y=Integer.valueOf(prop.getString("EFFECT_Y"));
		 Constants.EFFECT_N=Integer.valueOf(prop.getString("EFFECT_N"));
		 Constants.CREATOR=prop.getString("CREATOR");
		 Constants.UPDATER=prop.getString("UPDATER");
		 Constants.PARENTCODE=prop.getString("PARENTCODE");
		 Constants.ORDER_A=prop.getString("ORDER_A");
		 Constants.ORDER_D=prop.getString("ORDER_D");
		 Constants.PAGE=Integer.valueOf(prop.getString("PAGE"));
		 Constants.ROWS=Integer.valueOf(prop.getString("ROWS"));
		 Constants.PAY_Y=Integer.valueOf(prop.getString("PAY_Y"));
		 Constants.PAY_N=Integer.valueOf(prop.getString("PAY_N"));
		 
	}
	
}
