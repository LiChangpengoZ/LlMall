package system.order.model;

import java.util.List;

import system.base.BaseModel;
import system.product.model.ProductModel;

/**
 * 订单的model
 * @author 李昌鹏
 *
 */
public class OrderModel extends BaseModel{

	private Integer id;
	private String code;
	private String usercode;
	private String productcode;
	private Integer number;			//订单中有几件商品
	private String money;			//所有商品的价格
	private String addresscode;		//收货地址的主键
	private Integer state;			
	
	private List<ProductModel> productList;		//订单里产品的集合
	
	private Integer productNumber;
	
	//卖家查询订单需要的属性
	private String sbegintime;
	private String sendtime;
	private String susername;
	private String sproname;
	
	
	
	public String getSbegintime() {
		return sbegintime;
	}
	public void setSbegintime(String sbegintime) {
		this.sbegintime = sbegintime;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getSusername() {
		return susername;
	}
	public void setSusername(String susername) {
		this.susername = susername;
	}
	public String getSproname() {
		return sproname;
	}
	public void setSproname(String sproname) {
		this.sproname = sproname;
	}
	public Integer getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}
	
	public List<ProductModel> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductModel> productList) {
		this.productList = productList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getAddresscode() {
		return addresscode;
	}
	public void setAddresscode(String addresscode) {
		this.addresscode = addresscode;
	}
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}

}
