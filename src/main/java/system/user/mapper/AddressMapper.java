package system.user.mapper;

import java.util.List;

import system.user.model.AddressModel;

/**
 * 地址的mapper
 * @author 李昌鹏
 */
public interface AddressMapper {

	/**
	 * 查询地址的方法
	 * @param address
	 * @return
	 */
	List<AddressModel> select(AddressModel address);
	
	/**
	 * 插入地址的方法
	 * @param address
	 * @return
	 */
	Integer insert(AddressModel address);
	
	/**
	 * 删除地址
	 * @param address
	 * @return
	 */
	Integer delete(AddressModel address);
	
	/**
	 * 更新地址
	 * @param address
	 * @return
	 */
	Integer updateActive(AddressModel address);
}
