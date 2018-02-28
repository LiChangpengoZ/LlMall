package system.user.mapper;


import java.util.List;

import system.user.model.UserModel;

/**
 * 用户的mapper
 * @author 李昌鹏
 *
 */
public interface UserMapper {
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	Integer insert(UserModel user);
	
	/**
	 * 多条件查询用户条数
	 * @param user
	 * @return
	 */
	Integer selectCount(UserModel user);
	
	/**多条件查询的方法
	 * @param userTemp
	 * @return
	 */
	List<UserModel> select(UserModel userTemp); 
	
}
