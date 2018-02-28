package system.order.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import annotation.Auth;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import system.order.model.OAPModel;
import system.order.model.OrderModel;
import system.order.model.ShopCarModel;
import system.order.service.OrderService;
import system.user.model.AddressModel;
import system.user.model.UserModel;
import util.Constants;
import util.Tool;

/**
 * 订单的control，包含添加购物车、显示购物车、按钮+-通过ajax显示购物车、结算和提交的方法
 * @author 李昌鹏
 */
@Controller
@RequestMapping("/OrderController")
public class OrderController {
	
	@Autowired
	@Qualifier("orderService")
	OrderService orderService;
	
	/**
	 * 添加购物车的方法
	 * @param shopCar 购物车对象
	 * @return 成功或者失败的字符串
	 */
	@RequestMapping(value="/addShopCar.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String addShopCar(ShopCarModel shopCar) {
		if(shopCar==null) {
			return null;
		}
		//查找是否重复，如果有就数量+1
		
		ShopCarModel shopCarTemp=new ShopCarModel();
		shopCarTemp.setProductcode(shopCar.getProductcode());
		shopCarTemp.setUsercode(shopCar.getUsercode());
		shopCarTemp.setNumber(shopCar.getNumber());
		//，1说明有并且插入成功,-1说明没成功，0说明没有,
		int isHave=orderService.isRe(shopCarTemp);
		if(isHave==1) {
			return "添加成功~";	
		}
		if(isHave==-1) {
			return "添加失败！";
		}
		
		//现在这个model中有usercode和productcode和number
		//把其他的 存进去
		shopCar.setId(null);
		shopCar.setCreatetime(Tool.getDateTime());
		shopCar.setCreator(Constants.CREATOR);
		shopCar.setIsdelete(Constants.DELETE_N);
		shopCar.setIseffect(Constants.EFFECT_Y);
		
		boolean isAdd=orderService.addShopCar(shopCar);
		
		if(isAdd) {
			return "添加成功~";
		}else {
			return "添加失败！";
		}	
	}
	
	/**
	 * 显示购物车
	 * @param shopCar 购物车的对象
	 * @return ModelAndView的对象，跳转到购物车页
	 */
	@Auth(verifyLogin=true)
	@RequestMapping(value="/showShopCar.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView showShopCar(ShopCarModel shopCar) {
		if(shopCar==null) {
			return null;
		}
		//现在对象中有usercode
		List<ShopCarModel> list=orderService.showShopCar(shopCar);
		
		BigDecimal allmoney=new BigDecimal("0");
		JSONArray json=JSONArray.fromObject(list);
		ModelAndView mav=new ModelAndView();	
		mav.addObject("allmoney", allmoney.toString());
		mav.addObject("shopcar",json.toString());
		mav.setViewName("order/shopcar");
		return mav;
	}
	
	/**
	 * 加减删除过来的方法
	 * @param shopCar 购物车的对象
	 * @return 通过ajax返回一个商品的json字符串
	 */
	@RequestMapping(value="/showShopCarAjax.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public String showShopCarAjax(ShopCarModel shopCar) {
		if(shopCar==null) {
			return null;
		}
		//如果是从ajax来的，对象中有usercode。productcode和操作的字符串
		//如果是add,那就根据product修改数字
		if("add".equals(Tool.isNull(shopCar.getActions()))) {
			orderService.updateAddAndSub(shopCar);
		}
		if("sub".equals(Tool.isNull(shopCar.getActions()))) {
			orderService.updateAddAndSub(shopCar);
		}
		if("delete".equals(Tool.isNull(shopCar.getActions()))) {
			orderService.updateAddAndSub(shopCar);
		}
		List<ShopCarModel> list=orderService.showShopCar(shopCar);
		JSONArray json=JSONArray.fromObject(list);
		return json.toString();
	}
	
	/**
	 * 结算
	 * @param shopCar 购物车的对象
	 * @return ModelAndView对象，跳转到支付页面
	 */
	@RequestMapping(value="/pay.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView pay(String[] xz,HttpSession session) {
		if(xz==null) {
			UserModel user=(UserModel) session.getAttribute("user");
			if(user==null) {
				return new ModelAndView("login");
			}
			String usercode=user.getCode();
			ShopCarModel shopCar=new ShopCarModel();
			shopCar.setUsercode(usercode);
			ModelAndView mav= showShopCar(shopCar);
			return mav;
		}
		
		if(session==null) {
			return new ModelAndView("login");
		}
		UserModel user=(UserModel) session.getAttribute("user");
		if(user==null) {
			return new ModelAndView("login");
		}
		String usercode=user.getCode();
//		商品的
		List<ShopCarModel> productList=new ArrayList<ShopCarModel>();
		for (String string : xz) {
			ShopCarModel shopCar=new ShopCarModel();
			shopCar.setUsercode(usercode);
			shopCar.setProductcode(string);
			List<ShopCarModel> list=orderService.showShopCar(shopCar);
			productList.add(list.get(0));
		}
		JSONArray jproduct=JSONArray.fromObject(productList);
		
		//地址的
		AddressModel address=new AddressModel();
		address.setUsercode(usercode);
		List<AddressModel> addressList=orderService.getAddress(address);
		JSONArray jaddress=JSONArray.fromObject(addressList);
		ModelAndView mav=new ModelAndView();
		mav.addObject("jproduct", jproduct.toString());
		mav.addObject("jaddress", jaddress.toString());
		mav.setViewName("order/pay");
		return mav;
	}
	
	/**
	 * 点提交，创建订单，删除购物车
	 * @param order 订单的对象
	 * @return ModelAndView的对象，跳转到成功页面
	 */
	@RequestMapping(value="/submit.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView submit(OrderModel order) {
		//现在对象中有usercode, productcode, number, money, addresscode, 
		order.setId(null);
		order.setCode("o"+Tool.getDateTimeNoLine());
		order.setState(Constants.PAY_Y);
		order.setCreatetime(Tool.getDateTime());
		order.setCreator(Constants.CREATOR);
		order.setIsdelete(Constants.DELETE_N);
		order.setIseffect(Constants.EFFECT_Y);
		
		boolean isInsert= orderService.insertOrder(order);
		if(isInsert==false) {
			return null;
		}
		
		String products=order.getProductcode();
		String[] pros=products.split(",");
		
		//插入OAP表
		for (String pro : pros) {
			OAPModel oap=new OAPModel();
			oap.setId(null);
			oap.setOrdercode(order.getCode());
			oap.setProductcode(pro);
			ShopCarModel shopCarTemp=new ShopCarModel();
			shopCarTemp.setProductcode(pro);
			shopCarTemp.setUsercode(order.getUsercode());
			Integer number= orderService.selectNumByPro(shopCarTemp);
			oap.setProductnumber(number);
			orderService.inserOAP(oap);
		}
		
		for (String pro : pros) {
//			删除购物车
			ShopCarModel shopCar=new ShopCarModel();
			shopCar.setProductcode(pro);
			shopCar.setUsercode(order.getUsercode());	
			orderService.deleteShopCar(shopCar);
		}
	
		OrderModel orderTemp=new OrderModel();
		orderTemp.setCode(order.getCode());
		List<HashMap<String, Object>> list=orderService.select(orderTemp);
		HashMap<String, Object> success=list.get(0);
		JSONObject jsumap=JSONObject.fromObject(success);
		ModelAndView mav=new ModelAndView();
		mav.addObject("success", jsumap);
		mav.setViewName("order/success");
		return mav;
	}
	
	/**
	 * 点击立即结算
	 * @param shopCar
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/buy.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView buy(ShopCarModel shopCar,HttpSession session) {
		
		UserModel user=(UserModel) session.getAttribute("user");
		if(user==null) {
			return new ModelAndView("login");
		}
		String usercode=user.getCode();
		shopCar.setUsercode(usercode);
		ShopCarModel shopCarTemp=new ShopCarModel();
		shopCarTemp.setProductcode(shopCar.getProductcode());
		shopCarTemp.setUsercode(shopCar.getUsercode());
		shopCarTemp.setNumber(shopCar.getNumber());
		//，1说明有并且插入成功,-1说明没成功，0说明没有,
		Integer isRe= orderService.isRe(shopCarTemp);
		if(isRe==0) {
			orderService.addShopCar(shopCar);
		}
		
//		商品的
		List<ShopCarModel> productList=new ArrayList<ShopCarModel>();
		shopCar.setOnemoney(Tool.bigDecimalMath(shopCar.getPmoney(), shopCar.getNumber()));
		productList.add(shopCar);
		JSONArray jproduct=JSONArray.fromObject(productList);
		
		//地址的
		AddressModel address=new AddressModel();
		address.setUsercode(usercode);
		List<AddressModel> addressList=orderService.getAddress(address);
		JSONArray jaddress=JSONArray.fromObject(addressList);
		ModelAndView mav=new ModelAndView();
		mav.addObject("jproduct", jproduct.toString());
		mav.addObject("jaddress", jaddress.toString());
		mav.setViewName("order/pay");
		return mav;
	}
	
}
