package system.user.service;

import java.util.List;
import java.util.Map;

import system.order.model.OrderModel;
import system.user.model.AddressModel;
import system.user.model.DictionaryModel;
import system.user.model.UserModel;

/**
 * 用户的service
 * @author 李昌鹏
 *
 */
public interface UserService {

	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	boolean reg(UserModel user);

	/**
	 * 登陆的方法
	 * @param user
	 * @return
	 */
	int login(UserModel user);

	/**
	 * 查询字典表
	 * @param dictionary
	 * @return
	 */
	List<DictionaryModel> selectDic(DictionaryModel dictionary);

	/**
	 * 加载地址页面
	 * @param address
	 * @return
	 */
	List<AddressModel> addressShow(AddressModel address);

	/**
	 * 添加地址
	 * @param address
	 */
	void addAr(AddressModel address);

	/**
	 * 删除地址
	 * @param address
	 */
	void removeAr(AddressModel address);

	/**
	 * 更新地址
	 * @param address
	 */
	void updateAr(AddressModel address);

	/**
	 * 加载订单页面
	 * @param order
	 * @return
	 */
	List<Map<String, Object>> loadOrder(OrderModel order);

	/**
	 * 删除订单
	 * @param order
	 */
	void removeOrder(OrderModel order);

	/**
	 * 卖家查询谁卖的 
	 * @param order
	 * @return
	 */
	List<Map<String, Object>> selectAllBySeller(OrderModel order);
}
