package system.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import system.order.mapper.OrderMapper;
import system.order.model.OrderModel;
import system.product.mapper.ProductMapper;
import system.user.mapper.AddressMapper;
import system.user.mapper.DictionaryMapper;
import system.user.mapper.UserMapper;
import system.user.model.AddressModel;
import system.user.model.DictionaryModel;
import system.user.model.UserModel;
import system.user.service.UserService;
import util.Constants;
import util.Tool;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	DictionaryMapper dictionaryMapper;
	@Autowired
	AddressMapper addressMapper;
	@Autowired
	OrderMapper orderMapper;
	@Autowired
	ProductMapper productListMapper;
	
	public boolean reg(UserModel user) {
		if(user==null) {
			return false;
		}
		//定义临时对象，往里面存值
		UserModel userTemp=new UserModel();
		userTemp.setUsername(user.getUsername()==null?"":user.getUsername());
		
		//调用查询列数的方法，如果存在，就返回false
		int count=userMapper.selectCount(userTemp);
		if(count != 0) {
			return false;
		}
	
		userTemp.setPassword(user.getPassword()==null?"":user.getPassword());
		 String code="u"+Tool.getDateTimeNoLine();
		 userTemp.setCode(code);
		 userTemp.setId(null);
		 userTemp.setIsseller(user.getIsseller()==null?0:user.getIsseller());
		 userTemp.setCreatetime(Tool.getDateTime());
		 userTemp.setCreator(Constants.CREATOR);
		 userTemp.setUpdater(Constants.UPDATER);
		 userTemp.setIsdelete(Constants.DELETE_N);
		 userTemp.setIseffect(Constants.EFFECT_Y);
		 
		 //调用mapper的插入方法，得到int的返回值
		int insert=userMapper.insert(userTemp);
		if(insert==0) {
			return false;
		}else {
			return true;
		}
		
	}
	
	public int login(UserModel user) {
		if(user==null) {
			return 0;
		}
//		把账号和密码传进去，调用select方法，返回一个list集合
		UserModel userTemp=new UserModel();
		userTemp.setUsername(Tool.isNull(user.getUsername()));
		userTemp.setPassword(Tool.isNull(user.getPassword()));
		
		List<UserModel> list=userMapper.select(userTemp);
//		如果没有找到删除或者无效就返回0,
		if(list==null || list.isEmpty()) {
			return 0;
		}
		UserModel userdb=list.get(0);
		//通过引用传值把是否为商家传过去
		user.setIsseller(userdb.getIsseller());
		
//		把其他的也传过去
		user.setId(userdb.getId());
		user.setCode(userdb.getCode());
		user.setCreatetime(userdb.getCreatetime());
		user.setUpdatetime(userdb.getUpdatetime());
		user.setCreator(userdb.getCreator());
		user.setUpdater(userdb.getUpdater());
		user.setIsdelete(userdb.getIsdelete());
		user.setIseffect(userdb.getIseffect());
		
		if(userdb.getIsdelete()==1) {
			return 0;
		}
		if(userdb.getIseffect()==0) {
			return 0;
		}		
		return 1;
	}

	public List<DictionaryModel> selectDic(DictionaryModel dictionary) {
		return dictionaryMapper.select(dictionary);
	}

	public List<AddressModel> addressShow(AddressModel address) {
		
		return addressMapper.select(address);
	}

	public void addAr(AddressModel address) {
		addressMapper.insert(address);
	}

	public void removeAr(AddressModel address) {
		addressMapper.delete(address);
	}

	public void updateAr(AddressModel address) {
		addressMapper.updateActive(address);
	}

	public List<Map<String, Object>> loadOrder(OrderModel order) {
		
		return orderMapper.selectAll(order);
	}

	public void removeOrder(OrderModel order) {
		orderMapper.delete(order);
	}
	
	public List<Map<String, Object>> selectAllBySeller(OrderModel order) {
		return orderMapper.selectAllBySeller(order);
	}
	
}
