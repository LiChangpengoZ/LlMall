package system.user.mapper;

import java.util.List;

import system.user.model.DictionaryModel;

/**
 * 字典表的mapper
 * @author 李昌鹏
 */
public interface DictionaryMapper {

	/**
	 * 查询省市区
	 * @param dictionary
	 * @return
	 */
	List<DictionaryModel> select(DictionaryModel dictionary);
	
}
