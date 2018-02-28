package system.order.mapper;

import java.util.List;

import system.order.model.ShopCarModel;

/**
 * 购物车的mapper，
 * @author 李昌鹏
 *
 */
public interface ShopCarMapper {
	
	/**
	 * 插入购物车
	 * @param shopCar 购物车的对象
	 * @return 插入几条
	 */
	int insert(ShopCarModel shopCar);
	
	/**
	 * 查询是否重复
	 * @param shopCar 购物车的对象
	 * @return 查询到的条数
	 */
	int selectRe(ShopCarModel shopCar);
	
	/**
	 * 根据product查找number
	 * @param shopCar 购物车的对象
	 * @return 购买了几件商品
	 */
	int selectNumByPc(ShopCarModel shopCar);
	
	/**
	 * 根据product修改number
	 * @param shopCar 购物车的对象
	 * @return 修改了几条记录
	 */
	int updateNumByPc(ShopCarModel shopCar);
	
	/**
	 * 查询购物车
	 * @param shopCar 购物车的对象
	 * @return 包含主要信息的集合
	 */
	List<ShopCarModel> select(ShopCarModel shopCar);
	
	/**
	 * 根据productcode删除一条记录
	 * @param shopCar 购物车的对象
	 * @return 删除了几条
	 */
	int deleteByPc(ShopCarModel shopCar);
	
	/**
	 * 根据用户删除购物车
	 * @param shopCar 购物车的对象
	 * @return 删除了几条
	 */
	int delete(ShopCarModel shopCar); 
	
	/**
	 * 多条件删除
	 * @param shopCar 购物车的对象
	 * @return 删除了几条
	 */
	int deleteModel(ShopCarModel shopCar);

}
