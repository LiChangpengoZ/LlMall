package system.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import system.order.model.OrderModel;
import system.order.service.OrderService;
import system.product.model.ProductModel;
import system.user.model.AddressModel;
import system.user.model.DictionaryModel;
import system.user.model.UserModel;
import system.user.service.UserService;
import util.AuthCode;
import util.Constants;
import util.MD5;
import util.Tool;

/**
 * 用户的control
 * @author 李昌鹏
 *
 */
@Controller
@RequestMapping("/UserController")
public class UserController {

	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	@Autowired
	@Qualifier("orderService")
	OrderService orderService;

	/**
	 * 注册的方法，调用service的方法，如果成功就转发到登录页面，如果失败就跳转到注册页面
	 * @param user 用户的的对象
	 * @param img
	 * @param session
	 * @return 如果注册成功，就跳转到登录页面，失败就返回本页面
	 */
	@RequestMapping(value="/reg.do",method=RequestMethod.POST)
	public String reg(UserModel user,String img,HttpSession session) {
		//判断验证码
		if(!img.equals(session.getAttribute("authCode"))) {
			return "redirect:/jsp/register.jsp";
		}
		//加密
		user.setPassword(MD5.encry(user.getPassword()));
		boolean isReg =userService.reg(user);
		if (isReg) {
			return "login";	
		}else {
			return "redirect:/jsp/register.jsp";
		}
	}
	
	/**
	 * 登陆的方法
	 * @param user，包含账号密码
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String login(UserModel user,HttpServletRequest request) {
		System.out.println();
		user.setPassword(MD5.encry(user.getPassword()));
		int login=userService.login(user);
		//login等于1，登陆成功，如果是普通用户，跳到主页，如果是商家，跳到商家页面，登陆失败返回本页面
		if(login==1) {
			//把字典表的省市区存到session中
			DictionaryModel dictionary=new DictionaryModel();
			List<DictionaryModel> list=userService.selectDic(dictionary);
			request.getSession().setAttribute("dictionary", list);
			//把用户存到session中
			request.getSession().setAttribute("user", user);
			if(user.getIsseller()==1){
				return "redirect:/ProductController/sellerload.do";
			}
			if(user.getIsseller()==0) {
				return "index";
			}
		}
		if(login==0) {
			return "redirect:/jsp/login.jsp";
		}	
		return "redirect:/jsp/login.jsp";
	}
	
	/**
	 * 注销的方法
	 * @return
	 */
	@RequestMapping(value="/cacnel.do",method=RequestMethod.GET)
	public String cacnel(HttpSession session) {
		session.removeAttribute("user");
		return "login";
	}
	
	/**
	 * 验证码的方法
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/authCode.do",method=RequestMethod.GET)
	public void authCode(HttpServletRequest request,HttpServletResponse response) {
		try {
			ImageIO.write(AuthCode.getAuchCodeImg(request), "jpg", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	/**
	 * 地址显示
	 * @param shopCar
	 * @return
	 */
	@Auth(verifyLogin=true)
	@RequestMapping(value="/addressShow.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView addressShow(AddressModel address,HttpSession session) {
		UserModel user= (UserModel) session.getAttribute("user");
		if(user==null) {
			return new ModelAndView("login");
		}
		String usercode= user.getCode();
		address.setUsercode(usercode);
		
		List<AddressModel> list= userService.addressShow(address);
		
		JSONArray jaddress=JSONArray.fromObject(list);
		ModelAndView mav=new ModelAndView();
		mav.addObject("jaddress", jaddress.toString());
		mav.setViewName("user/address");
		
		return mav;
	}
	
	/**
	 * 加载省市区
	 * @param dictionary 对象中有parentcode
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/loadssq.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public String loadssq(DictionaryModel dictionary,HttpSession session) {
		//现在对象中有parentcode
		@SuppressWarnings("unchecked")
		List<DictionaryModel> diclist=  (List<DictionaryModel>)session.getAttribute("dictionary");
		String parentcode= dictionary.getParentcode();
		List<DictionaryModel> list=new ArrayList<DictionaryModel>();
		for (DictionaryModel dictionaryModel : diclist) {
			if (parentcode.equals(dictionaryModel.getParentcode())) {
				list.add(dictionaryModel);
			}
		}
		
		JSONArray ssqlist=JSONArray.fromObject(list);
		return ssqlist.toString();
	}
	
	/**
	 * 添加地址的方法
	 * @param address
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/addar.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public String addar(AddressModel address,HttpSession session) {
		if (address==null) {
			return null;
		}
		//现在对象中有收货人 手机号 省市区详细地址 
		address.setId(null);
		address.setCode("d"+Tool.getDateTimeNoLine());
		UserModel user= (UserModel) session.getAttribute("user");
		if(user==null) {
			return "redirect:/jsp/login.jsp";
		}
		String usercode= user.getCode();
		address.setUsercode(usercode);
		address.setCreatetime(Tool.getDateTime());
		address.setCreator(Constants.CREATOR);
		address.setIsdelete(Constants.DELETE_N);
		address.setIseffect(Constants.EFFECT_Y);
		userService.addAr(address);
		return "redirect:/UserController/addressShow.do";
	}	
	
	/**
	 * 删除地址的方法
	 * @param address
	 * @return
	 */
	@RequestMapping(value="/removeAr.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public String removeAr(AddressModel address) {
		//现在对象中有code属性
		userService.removeAr(address);
		return "";
	}
	
	/**
	 * 更新地址的方法
	 * @param address
	 * @return
	 */
	@RequestMapping(value="/updateAr.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public String updateAr(AddressModel address) {
		if(address.getCode()==null || "".equals(address.getCode())) {
			return null;
		}
		//现在对象中有code、人、电话、省市区,详细地址
		address.setUpdatetime(Tool.getDateTime());
		address.setUpdater(Constants.UPDATER);		
		userService.updateAr(address);
		//现在对象中有code
		return "";
	}
	
	/**
	 * 加载订单的方法
	 * @param order
	 * @param session
	 * @return
	 */
	@Auth(verifyLogin=true)
	@RequestMapping(value="/loadOrder.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView loadOrder(OrderModel order,HttpSession session) {
		UserModel user= (UserModel) session.getAttribute("user");
		if(user==null) {
			return new ModelAndView("login");
		}
		String usercode= user.getCode();
		order.setUsercode(usercode);
		//现在对象中只有用户的code
		List<Map<String, Object>> list=userService.loadOrder(order);
		
		List<OrderModel> orderlist=new Vector<OrderModel>();
		
		//订单code的集合
		Set<String> ordercode=new HashSet<String>();
		//遍历返回的，获取订单的code
		for (Map<String, Object> map : list) {
			ordercode.add(map.get("ocode").toString());
		}
		//遍历订单名，在订单的list中创建现在的所有订单
		for (String string : ordercode) {
			OrderModel orderTemp=new OrderModel();
			orderTemp.setCode(string);
			orderlist.add(orderTemp);
		}
		
		//遍历所有产品。把对应的加在他们的订单中
		for (Map<String, Object> map : list) {
			for (OrderModel orderModel : orderlist) {
				if(map.containsValue(orderModel.getCode())) {
					orderModel.setCode(map.get("ocode").toString());			
					orderModel.setMoney(map.get("omoney").toString());
					orderModel.setCreatetime(map.get("createtime").toString());
					
					if(orderModel.getProductList()==null) {
						List<ProductModel> listTemp=new ArrayList<ProductModel>();
						ProductModel productTemp=new ProductModel();
						productTemp.setProductNumber(Integer.valueOf(map.get("oapnumber").toString()));
						productTemp.setProductname(map.get("pproductname").toString());
						productTemp.setMoney(map.get("pmoney").toString());
						productTemp.setCode(map.get("pcode").toString());
						productTemp.setUrl(map.get("purl").toString());
						listTemp.add(productTemp);
						orderModel.setProductList(listTemp);
						continue;
					}
					List<ProductModel> listTemp= orderModel.getProductList();
					ProductModel productTemp=new ProductModel();
					productTemp.setProductNumber(Integer.valueOf(map.get("oapnumber").toString()));
					productTemp.setProductname(map.get("pproductname").toString());
					productTemp.setMoney(map.get("pmoney").toString());
					productTemp.setCode(map.get("pcode").toString());
					productTemp.setUrl(map.get("purl").toString());
					listTemp.add(productTemp);
					orderModel.setProductList(listTemp);
					
				}
			}
		}
		
		JSONArray jorderlist=JSONArray.fromObject(orderlist);
		ModelAndView mav=new ModelAndView();
		mav.addObject("jorderlist",jorderlist.toString());
		mav.setViewName("user/order");
		return mav;
	}
	
	
	/**
	 * 删除订单的方法
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/removeOrder.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public String removeOrder(OrderModel order) {
		userService.removeOrder(order);
		return "";
	}
	
	/**
	 * 订单的详情页
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/orderInfo.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public ModelAndView orderInfo(OrderModel order) {
		//现在对象中只有订单的code
		List<HashMap<String, Object>> list=orderService.select(order);
		HashMap<String, Object> success=list.get(0);
		JSONObject jsumap=JSONObject.fromObject(success);
		
		List<Map<String, Object>> allList =orderService.selectAllByCode(order);
		JSONArray jallList=JSONArray.fromObject(allList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("success", jsumap);
		mav.addObject("jallList", jallList.toString());
		mav.setViewName("user/orderinfo");
		return mav;
	}
	
	@RequestMapping(value="/sellerOrder.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView sellerOrder(OrderModel order,HttpSession session) {
		UserModel user= (UserModel) session.getAttribute("user");
		if(user==null) {
			return new ModelAndView("login");
		}
		String usercode= user.getCode();
		order.setUsercode(usercode);
		if(order.getSbegintime()!=null) {
			order.setSbegintime(order.getSbegintime()+" 00:00:00");
		}
		if(order.getSendtime()!=null) {
			order.setSendtime(order.getSendtime()+" 59:59:59");
		}
		
		List<Map<String, Object>> all= orderService.selectAllBySeller(order);
		//买家的集合
		List<UserModel> userlist=new ArrayList<UserModel>();
		//订单的集合
		List<OrderModel> orderlist=new Vector<OrderModel>();
		//获取买家
		//获取所有订单
		Set<String> userCodeSet=new HashSet<String>();
		Set<String> orderCoderSet=new HashSet<String>();
		for (Map<String, Object> temp : all) {
			userCodeSet.add(temp.get("uname").toString());
			orderCoderSet.add(temp.get("ocode").toString());
		}
		//把用户名放到用户的集合
		for (String string : userCodeSet) {
			UserModel usertemp=new UserModel();
			usertemp.setUsername(string);
			List<OrderModel> ordertemplist=new ArrayList<OrderModel>();
			usertemp.setOrderlist(ordertemplist);
			userlist.add(usertemp);
		}
		//把用户名放到用户的集合
		for (Map<String, Object> temp1 : all) {
			for (UserModel temp2 : userlist) {
				if((temp1.get("uname").toString()).equals(temp2.getUsername())) {
					temp2.setCode(temp1.get("ucode").toString());
				}
			}
		}
		
		//遍历订单名，在订单的list中创建现在的所有订单
		for (String string : orderCoderSet) {
			OrderModel orderTemp=new OrderModel();
			orderTemp.setCode(string);
			List<ProductModel> products=new ArrayList<ProductModel>();
			orderTemp.setProductList(products);
			orderlist.add(orderTemp);
		}
		
		//遍历所有产品。把对应的加在他们的订单中
		for (Map<String, Object> map : all) {
			for (OrderModel orderModel : orderlist) {
				if(map.containsValue(orderModel.getCode())) {
					orderModel.setCode(map.get("ocode").toString());			
					orderModel.setMoney(map.get("omoney").toString());
					orderModel.setUsercode(map.get("ucode").toString());
					orderModel.setCreatetime(map.get("createtime").toString());
					
					List<ProductModel> listTemp= orderModel.getProductList();
					ProductModel productTemp=new ProductModel();
					productTemp.setProductNumber(Integer.valueOf(map.get("oapnumber").toString()));
					productTemp.setProductname(map.get("pproductname").toString());
					productTemp.setMoney(map.get("pmoney").toString());
					productTemp.setCode(map.get("pcode").toString());
					productTemp.setUrl(map.get("purl").toString());
					listTemp.add(productTemp);
					orderModel.setProductList(listTemp);
				}
			}
		}
		//遍历订单，把订单放到用户里
		for (OrderModel orders : orderlist) {
			for (UserModel users : userlist) {
				if(orders.getUsercode().equals(users.getCode())) {
					List<OrderModel> temp=users.getOrderlist();
					temp.add(orders);
					user.setOrderlist(temp);
				}
			}
		}
		
		JSONArray jusers=JSONArray.fromObject(userlist);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("jusers", jusers.toString());
		mav.setViewName("seller/sorder");
		return mav;
	}
}
