package system.user.model;

import java.util.List;

import system.base.BaseModel;
import system.order.model.OrderModel;

/**
 * 用户的model
 * @author 李昌鹏
 */
public class UserModel extends BaseModel{
	
	private Integer id;
	private String username;
	private String code;
	private String password;
	private Integer isseller;
	
	private List<OrderModel> orderlist;
	
	public List<OrderModel> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<OrderModel> orderlist) {
		this.orderlist = orderlist;
	}
	public UserModel() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIsseller() {
		return isseller;
	}
	public void setIsseller(Integer isseller) {
		this.isseller = isseller;
	}
	
}
