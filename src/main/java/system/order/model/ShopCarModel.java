package system.order.model;

import system.base.BaseModel;

/**
 * 购物车的model
 * @author 李昌鹏
 */
public class ShopCarModel extends BaseModel{

	private Integer id;
	private String usercode;
	private String productcode;
	private Integer number;
	
	
	private String purl;		//产品的图片
	private String pproductname;//产品的名字
	private String pmoney;		//产品的单价
	
	private String onemoney;	//一件商品的总价
	
	private String actions;		//做的操作，增加减少，修改啥的
	
	public String getActions() {
		return actions;
	}
	public void setActions(String actions) {
		this.actions = actions;
	}
	public String getOnemoney() {
		return onemoney;
	}
	public void setOnemoney(String onemoney) {
		this.onemoney = onemoney;
	}
	
	public String getPurl() {
		return purl;
	}
	public void setPurl(String purl) {
		this.purl = purl;
	}
	public String getPproductname() {
		return pproductname;
	}
	public void setPproductname(String pproductname) {
		this.pproductname = pproductname;
	}
	public String getPmoney() {
		return pmoney;
	}
	public void setPmoney(String pmoney) {
		this.pmoney = pmoney;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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

}
