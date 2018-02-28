package system.product.model;

import system.base.BaseModel;

/**产品的model
 * @author 李昌鹏
 */
public class ProductModel extends BaseModel{

	private Integer id;
	private String productname;
	private String code;
	private String money;
	private String descr;
	private Integer number;
	private String usercode;
	private String url;
	private Integer state;
	private String productTypecode;

	private Integer productNumber;
	
	public Integer getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public String getProductTypecode() {
		return productTypecode;
	}
	public void setProductTypecode(String productTypecode) {
		this.productTypecode = productTypecode;
	}
	
}
