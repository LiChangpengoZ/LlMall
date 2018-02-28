package system.product.mapper;

import java.util.List;

import system.product.model.ProductModel;
import system.user.model.UserModel;

/**
 * 产品的mapper
 * @author 李昌鹏
 */
public interface ProductMapper {

	/**查询产品的详细信息
	 * @param product
	 * @return 全部信息产品的集合
	 */
	List<ProductModel> select(ProductModel product);

	/**
	 * 多条件查询多少件商品
	 * @param product
	 * @return
	 */
	int selectCount(ProductModel product);

	/**
	 * 根据卖家查询商品
	 * @param user user的code就是产品的usercode
	 * @return 产品的集合
	 */
	List<ProductModel> selectBySeller(UserModel user);

	/**
	 * 修改产品
	 * @param product
	 * @return 修改了几条
	 */
	Integer update(ProductModel product);

	/**
	 * 插入产品
	 * @param product
	 * @return 插入了几条
	 */
	Integer insert(ProductModel product);
}
