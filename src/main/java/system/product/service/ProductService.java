package system.product.service;

import java.util.List;

import system.product.model.ProductModel;
import system.product.model.ProductTypeModel;
import system.user.model.UserModel;

public interface ProductService {

	/**
	 * 加载商品类型的方法
	 * @param productType
	 * @return List<ProductTypeModel> 产品类型的集合
	 */
	List<ProductTypeModel> loadList(ProductTypeModel productType);

	/**查询的方法
	 * @param product
	 * @return List<ProductModel> 产品的集合
	 */
	List<ProductModel> search(ProductModel product);

	/**
	 * 获取多少件商品的方法
	 * @param product
	 * @return int 商品的条数
	 */
	int getCount(ProductModel product);

	/**
	 * 加载卖家页面
	 * @param user user的对象
	 * @return 产品的集合
	 */
	List<ProductModel> sellerLoad(UserModel user);

	/**
	 * 修改产品
	 * @param product
	 * @return boolean 是否更新成功
	 */
	boolean updatePro(ProductModel product);

	/**
	 * 插入产品
	 * @param product
	 * @return
	 */
	boolean insertPro(ProductModel product);

	/**
	 * 增加分类
	 * @param productType
	 */
	void insertType(ProductTypeModel productType);

	/**
	 * 删除分类
	 * @param productType
	 * @return
	 */
	Integer deleteType(ProductTypeModel productType);

	/**
	 * 修改分类
	 * @param productType
	 * @return
	 */
	Integer updateType(ProductTypeModel productType);


}
