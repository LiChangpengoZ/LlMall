package system.order.model;

/**
 * 订单和商品关联表的model
 * @author 李昌鹏
 */
public class OAPModel {

	private Integer id;
	private String ordercode;
	private String productcode;
	private Integer productnumber;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public Integer getProductnumber() {
		return productnumber;
	}
	public void setProductnumber(Integer productnumber) {
		this.productnumber = productnumber;
	}
	
	

	
}
