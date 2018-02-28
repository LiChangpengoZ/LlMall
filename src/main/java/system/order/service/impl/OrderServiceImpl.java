package system.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import system.order.mapper.OrderMapper;
import system.order.mapper.ShopCarMapper;
import system.order.model.OAPModel;
import system.order.model.OrderModel;
import system.order.model.ShopCarModel;
import system.order.service.OrderService;
import system.user.mapper.AddressMapper;
import system.user.model.AddressModel;
import util.Tool;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	ShopCarMapper shopCarMapper;
	
	@Autowired
	AddressMapper addressMapper;
	
	@Autowired
	OrderMapper orderMapper;
		
	public boolean addShopCar(ShopCarModel shopCar) {
		int count=shopCarMapper.insert(shopCar);
		if(count>0) {
			return true;
		}else {
			return false;
		}	
	}

	public int isRe(ShopCarModel shopCarTemp) {
		//只有product
		//1说明有并且插入成功,-1说明没成功，0说明没有,
		int isRe= shopCarMapper.selectRe(shopCarTemp);
		if(isRe!=0) {
			int num= shopCarMapper.selectNumByPc(shopCarTemp);
			num=num+shopCarTemp.getNumber();
			shopCarTemp.setNumber(num);
			int isUpdate=shopCarMapper.updateNumByPc(shopCarTemp);
				if(isUpdate>0) {
					return 1;
				}else {
					return -1;
				}
		}else {
			return 0;
		}
	}

	public List<ShopCarModel> showShopCar(ShopCarModel shopCar) {
		List<ShopCarModel> list= shopCarMapper.select(shopCar);
		//现在list的model中有
		//id, usercode, productcode, number,pproductname,pmoney,purl
		//把每一件商品的总价放进去
		for (ShopCarModel shopCarModel : list) {
			shopCarModel.setOnemoney(Tool.bigDecimalMath(shopCarModel.getPmoney(), shopCarModel.getNumber()));
		}
		return list;
	}

	public void updateAddAndSub(ShopCarModel shopCar) {
		int num= shopCarMapper.selectNumByPc(shopCar);
		//查询到num，如果是add就加1放进去，如果是sub就-1放进去，如果num=0了就删除，
		//加减
		boolean temp=false;
		if("add".equals(shopCar.getActions())) {
			num=num+1;
			temp=true;
		}
		if("sub".equals(shopCar.getActions())) {
			num=num-1;
			if(num==0) {
				shopCarMapper.deleteByPc(shopCar);
			}
			temp=true;
		}
		if(temp) {
			shopCar.setNumber(num);
			shopCarMapper.updateNumByPc(shopCar);
		}
//		删除
		if("delete".equals(shopCar.getActions())){
			shopCarMapper.deleteByPc(shopCar);
		}
	}

	public List<AddressModel> getAddress(AddressModel address) {
		//现在对象中只有usercode		
		return addressMapper.select(address);
	}

	public boolean insertOrder(OrderModel order) {
		
		Integer insertCount=orderMapper.insert(order);
		if(insertCount==0) {
			return false;
		}else {
			return true;
		}
	}

	public List<HashMap<String, Object>> select(OrderModel order) {
		return orderMapper.selectSucess(order);
	}

	public void deleteShopCar(ShopCarModel shopCar) {
		shopCarMapper.deleteModel(shopCar);	
	}

	public void inserOAP(OAPModel oap) {
		orderMapper.insertOAP(oap);
	}

	public Integer selectNumByPro(ShopCarModel shopCarTemp) {	
		return shopCarMapper.selectNumByPc(shopCarTemp);
	}


	public List<Map<String, Object>> selectAllByCode(OrderModel order) {
		
		return orderMapper.selectAllByCode(order);
	}

	public List<Map<String, Object>> selectAllBySeller(OrderModel order) {
		return orderMapper.selectAllBySeller(order);
	}

}
