package system.product.model;

import system.base.BaseModel;


/**
 * 产品类型的model
 * @author 李昌鹏
 */
public class ProductTypeModel extends BaseModel{

	private Integer id;
	private String typename;
	private String code;
	private String descr;
	private String parentcode;
	
	private Double orderby;
	
	public Double getOrderby() {
		return orderby;
	}
	public void setOrderby(Double orderby) {
		this.orderby = orderby;
	}
	public ProductTypeModel() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	
}
