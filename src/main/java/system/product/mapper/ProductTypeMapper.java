package system.product.mapper;

import java.util.List;

import system.product.model.ProductTypeModel;

/**
 * 类型的mapper
 * @author 李昌鹏
 */
public interface ProductTypeMapper {

	/**
	 * 查询所有分类
	 * @param productType
	 * @return
	 */
	List<ProductTypeModel> select(ProductTypeModel productType);

	/**
	 * 增加二级分类
	 * @param productType
	 * @return
	 */
	Integer insert(ProductTypeModel productType);

	/**
	 * 删除二级分类
	 * @param productType
	 * @return
	 */
	Integer delete(ProductTypeModel productType);

	/**
	 * 修改一级或者二级分类
	 * @param productType
	 * @return
	 */
	Integer update(ProductTypeModel productType);
	
}
