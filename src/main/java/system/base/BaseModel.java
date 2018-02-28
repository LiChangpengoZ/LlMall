package system.base;


/**
 * 基础的model类
 * @author 李昌鹏
 *
 */
public class BaseModel {

	private String orderBy;		//排序方式
	private String sortField;	//要排序的字段
	
	private Integer pageNumber;
	private Integer rowsNumber;
	private Integer beginNumber;
	
	private String createtime; 
	private String updatetime;
	private String creator;
	private String updater;
	private Integer isdelete;
	private Integer iseffect;
	
	
	
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public Integer getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}
	public Integer getIseffect() {
		return iseffect;
	}
	public void setIseffect(Integer iseffect) {
		this.iseffect = iseffect;
	}
	public Integer getBeginNumber() {
		return beginNumber;
	}
	public void setBeginNumber(Integer beginNumber) {
		this.beginNumber = beginNumber;
	}
	public Integer getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	public Integer getRowsNumber() {
		return rowsNumber;
	}
	public void setRowsNumber(Integer rowsNumber) {
		this.rowsNumber = rowsNumber;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getSortField() {
		return sortField;
	}
	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

}
