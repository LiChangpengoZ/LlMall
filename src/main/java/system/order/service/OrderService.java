package system.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import system.order.model.OAPModel;
import system.order.model.OrderModel;
import system.order.model.ShopCarModel;
import system.user.model.AddressModel;

/**
 * 订单的service
 * @author 李昌鹏
 *
 */
public interface OrderService {

	/**
	 * 添加购物车的方法
	 * @param shopCar 购物车的对象
	 * @return boolean的对象，是否添加成功
	 */
	boolean addShopCar(ShopCarModel shopCar);

	/**
	 * 判断是否重复的方法
	 * @param shopCarTemp 购物车的对象
	 * @return 查询的条数
	 */
	int isRe(ShopCarModel shopCarTemp);

	/**
	 * 显示购物车的方法
	 * @param shopCar
	 * @return List购物车商品的详细信息
	 */
	List<ShopCarModel> showShopCar(ShopCarModel shopCar);

	/**
	 * 页面点击加或者减，更新数据库number的方法
	 * @param shopCar 购物车的对象
	 */
	void updateAddAndSub(ShopCarModel shopCar);

	/**
	 * 获取地址的方法
	 * @param address 地址的对象
	 * @return List<AddressModel> 地址的结合
	 */
	List<AddressModel> getAddress(AddressModel address);

	/**
	 * 插入订单的方法
	 * @param order 订单的对象
	 * @return boolean 是否插入成功
	 */
	boolean insertOrder(OrderModel order);

	/**
	 * 查询订单的方法
	 * @param order 订单的对象
	 * @return List<HashMap<String, Object>> 订单中成功信息的集合
	 */
	List<HashMap<String, Object>> select(OrderModel order);

	/**
	 * 删除购物车
	 * @param shopCar 购物车的对象
	 */
	void deleteShopCar(ShopCarModel shopCar);

	/**
	 * 插入订单和产品的关联表
	 * @param oap 关联表的对象
	 */
	void inserOAP(OAPModel oap);

	/**
	 * 根据产品的code查询产品购买了多少个
	 * @param shopCarTemp 购物车的对象
	 * @return 购买的数量
	 */
	Integer selectNumByPro(ShopCarModel shopCarTemp);

	/**
	 * 根据code查询全部信息
	 * @param order
	 * @return
	 */
	List<Map<String, Object>> selectAllByCode(OrderModel order);
	
	/**
	 * 卖家查询订单
	 * @param order
	 * @return
	 */
	List<Map<String, Object>> selectAllBySeller(OrderModel order);

}
