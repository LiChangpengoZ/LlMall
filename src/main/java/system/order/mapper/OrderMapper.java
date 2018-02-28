package system.order.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import system.order.model.OAPModel;
import system.order.model.OrderModel;

/**
 * 订单的mapper，查询成功，插入、插入aop、查询和删除的方法
 * @author 李昌鹏
 *
 */
public interface OrderMapper {
	/**
	 * 查询成功页面数据
	 * @param order 订单对象
	 * @return 收件人、省市区、详细地址等的HashMap对象
	 */
	List<HashMap<String, Object>> selectSucess(OrderModel order);
	
	/**
	 * 插入订单
	 * @param order 订单的对象
	 * @return 插入几条
	 */
	Integer insert(OrderModel order);
	
	/**
	 * 插入订单和产品的关联表
	 * @param oap 关联表的对象
	 * @return 插入成功几条
	 */
	Integer insertOAP(OAPModel oap);

	/**
	 * 查询全部信息
	 * @param order
	 * @return 全部信息的集合
	 */
	List<Map<String, Object>> selectAll(OrderModel order);

	/**
	 * 删除订单
	 * @param order 订单的对象
	 * @return 删除几条
	 */
	Integer delete(OrderModel order);
	
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
