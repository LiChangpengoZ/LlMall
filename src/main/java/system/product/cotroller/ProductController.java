package system.product.cotroller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import system.product.model.ProductModel;
import system.product.model.ProductTypeModel;
import system.product.service.ProductService;
import system.user.model.UserModel;
import util.Constants;
import util.Tool;

/**
 * 产品的control
 * @author 李昌鹏
 */
@Controller
@RequestMapping("/ProductController")
public class ProductController {

	@Autowired
	@Qualifier("productService")
	ProductService productService;
	
	/**
	 * 加载产品列表
	 * @return 返回的是一级类型的集合里面包含二级类型的集合的集合
	 */
	@RequestMapping(value="/loadpdlist.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String loadPdList(){
		ProductTypeModel productType=new ProductTypeModel();
		//排序
		productType.setOrderBy(Constants.ORDER_A);
		productType.setSortField("orderby");
		//查询到的集合，
		List<ProductTypeModel> list=productService.loadList(productType);
		//新建的集合
		List<Map<String, Object>> productList=new ArrayList<Map<String, Object>>();
		
		for (ProductTypeModel prodectTypeModel : list) {
			String parentcode =  prodectTypeModel.getParentcode();
			if("0000".equals(parentcode)) {
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("typename", prodectTypeModel.getTypename());
				map.put("code", prodectTypeModel.getCode());
				List<Map<String, Object>> pl = new ArrayList<Map<String, Object>>();
				map.put("list", pl);
				productList.add(map);
				continue;
			}
			for(Map<String, Object> m : productList) {
				if(m.containsValue(parentcode)){
					@SuppressWarnings("unchecked")
					List<Map<String, Object>> pl = (List<Map<String, Object>>)m.get("list");
					Map<String, Object> map2=new HashMap<String, Object>();
					map2.put("typename", prodectTypeModel.getTypename());
					map2.put("code", prodectTypeModel.getCode());
					pl.add(map2);
					m.put("list", pl);
				}
			}
			
		}
				
		JSONArray json=JSONArray.fromObject(productList);
		return json.toString();
	}
	
	/**
	 * 查询商品的方法
	 * @param product 现在对象中有名字
	 * @return
	 */
	@RequestMapping(value="/search.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView search(ProductModel product) {
		//分页,设置第几页，有几行
		product.setPageNumber(Constants.PAGE);
		product.setRowsNumber(Constants.ROWS);
		//设置开始在第几行，因为mybatis的xml无法做加减法
		product.setBeginNumber((product.getPageNumber()-1)*product.getRowsNumber());
		//现在对象中有productname、page和rows
		List<ProductModel> list=productService.search(product);
		int count =productService.getCount(product);
				
		Map<String, Object> jsonMap = new HashMap<>();
	    jsonMap.put("total", count);
	    jsonMap.put("rows", list);
	    jsonMap.put("pageNum", product.getPageNumber());
	    jsonMap.put("rowsNum", product.getRowsNumber());
	    jsonMap.put("name", product.getProductname());
	    JSONObject result=JSONObject.fromObject(jsonMap);
	    //把返回的json存到mv中返回
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result.toString());
		mav.setViewName("product/search");
		return mav;
	}
	
	/**
	 * 分页按键，按上一页下一页进行查询
	 * @param product对象中有产品名称
	 * @return
	 */
	@RequestMapping(value="/searchLimit.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String  searchLimit(ProductModel product) {
		//设置开始在第几行
		product.setBeginNumber((product.getPageNumber()-1)*product.getRowsNumber());
		//现在对象中有productname、page和rows
		List<ProductModel> list=productService.search(product);
		int count =productService.getCount(product);
		
		Map<String, Object> jsonMap = new HashMap<>();
	    jsonMap.put("total", count);
	    jsonMap.put("rows", list);
	    jsonMap.put("pageNum", product.getPageNumber());
	    jsonMap.put("rowsNum", product.getRowsNumber());
	    jsonMap.put("name", product.getProductname());
	    JSONObject result=JSONObject.fromObject(jsonMap);	
		return result.toString();
	}
	
	/**
	 * 加载详情页
	 * @param product 产品的对象，有code属性
	 * @return 返回产品的信息，跳转到详情页
	 */
	@RequestMapping(value="/datail.do",method=RequestMethod.GET,produces="application/text;charset=utf-8")
	public ModelAndView  datail(ProductModel product) {
		//现在对象中有code
		List<ProductModel> list=productService.search(product);
		ProductModel productModel=list.get(0);
		JSONObject json =JSONObject.fromObject(productModel);
		//把返回的json存到mv中返回
		ModelAndView mav=new ModelAndView();
		mav.addObject("json",json);
		mav.setViewName("product/datail");
		return mav;
	}
	
	/**
	 * 加载卖家页面的方法，会返回商品集合
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/sellerload.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView sellerload(UserModel user,HttpSession session) {
		UserModel sessionuser= (UserModel) session.getAttribute("user");
		if(sessionuser==null) {
			return new ModelAndView("login");
		}
		String usercode= sessionuser.getCode();
		user.setCode(usercode);
		//现在商家中只有code属性
		
		List<ProductModel> list=productService.sellerLoad(user);
		JSONArray sellerproduct=JSONArray.fromObject(list);
		
		//查询分类
		ProductTypeModel productType=new ProductTypeModel();
		productType.setOrderBy(Constants.ORDER_A);
		productType.setSortField("orderby");
		List<ProductTypeModel> typelist=productService.loadList(productType);
//		存到session中
		session.setAttribute("typelist", typelist);
//		遍历集合，把一级分类获取到
		List<ProductTypeModel> onetypelist=new ArrayList<ProductTypeModel>();
		for (ProductTypeModel productTypeModel : typelist) {
			if("0000".equals(productTypeModel.getParentcode())) {
				onetypelist.add(productTypeModel);
			}
		}
		JSONArray jonetypelist=JSONArray.fromObject(onetypelist);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("jonetypelist", jonetypelist.toString());
		mav.addObject("sellerproduct", sellerproduct.toString());
		mav.setViewName("seller/seller");
		return mav;
	}
	
	/**
	 * 加载商品的二级分类
	 * @param productType 产品类型的对象，有parentcode属性
	 * @param session 
	 * @return
	 */
	@RequestMapping(value="/loadTwo.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	@ResponseBody
	public String loadTwo(ProductTypeModel productType,HttpSession session) {
		//现在对象中有一级 的code
		@SuppressWarnings("unchecked")
		List<ProductTypeModel> typelist=(List<ProductTypeModel>) session.getAttribute("typelist");
		List<ProductTypeModel> twolist=new ArrayList<ProductTypeModel>();
		for (ProductTypeModel productTypeModel : typelist) {
			if (productType.getCode().equals(productTypeModel.getParentcode())) {
				twolist.add(productTypeModel);
			}
		}
		
		JSONArray jtwolist=JSONArray.fromObject(twolist);
		return jtwolist.toString();
	}
	
	
	/**
	 * 更新产品
	 * @param file 上传的图片
	 * @param product 产品的对象
	 * @param session 获取绝对路径
	 * @return
	 */
	@RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
    public String upload(@RequestParam(value="file",required=false) CommonsMultipartFile file,ProductModel product,HttpSession session){
		String path;				//绝对路径
		String datepath;			//存入数据库中的路径
		if(file.getSize() !=0) {	//如果上传了文件
			String fileName = file.getOriginalFilename();
			path = session.getServletContext().getRealPath("/") +
					"/images/product/" + Tool.getDateTimeNoLine()
					+ fileName.substring(fileName.lastIndexOf('.'));
			datepath="/images/product/" + Tool.getDateTimeNoLine()
		         	+ fileName.substring(fileName.lastIndexOf('.'));
			File newFile=new File(path);
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setUrl(datepath);  
		}
		 //现在对象中有名称、单价，数量分类描述
		 //id, productname, code, money, descr, number，usercode, url, state, product_typecode, createtime, updatetime, creator, updater, isdelete, iseffect
		 product.setUpdater(Constants.UPDATER);
		 product.setUpdatetime(Tool.getDateTime());
		 boolean isUpdate= productService.updatePro(product);
		 if(isUpdate) {
			return "redirect:/ProductController/sellerload.do";
		 }else {
			 return "";
		 }
		 
	}
	
	/**
	 * 插入商品的方法
	 * @param file
	 * @param product
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/insertPro.do", method = RequestMethod.POST)
    public String insertPro(@RequestParam(value="file",required=false) CommonsMultipartFile file,ProductModel product,HttpSession session){
		String path;
		String datepath;
		if(file.getSize() !=0) {
			String fileName = file.getOriginalFilename();
			path = session.getServletContext().getRealPath("/") +
					"/images/product/" + Tool.getDateTimeNoLine()
			         + fileName.substring(fileName.lastIndexOf('.'));
			datepath="/images/product/" + Tool.getDateTimeNoLine()
					+ fileName.substring(fileName.lastIndexOf('.'));
			File newFile=new File(path);
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setUrl(datepath);  
		}
		UserModel user=(UserModel) session.getAttribute("user");
		if(user==null) {
			return "redirect:/jsp/login.jsp";
		}
		//现在对象中有名称、单价，数量分类描述
		 //id, productname, code, money, descr, number，usercode, url,  product_typecode, createtime, updatetime, creator, updater, isdelete, iseffect
		product.setId(null);
		product.setCode("p"+Tool.getDateTimeNoLine());
		product.setUsercode(user.getCode());
		product.setCreatetime(Tool.getDateTime());
		product.setCreator(Constants.CREATOR);
		product.setIsdelete(Constants.DELETE_N);
		product.setIseffect(Constants.EFFECT_Y);
		boolean isInsert= productService.insertPro(product);
		if(isInsert) {
			return "redirect:/ProductController/sellerload.do";
		}else {
			return "";
		}
	}
	
	/**
	 * 加载分类管理页面
	 * @param session
	 * @return 一级分类的集合，跳转到分类管理页面
	 */
	@RequestMapping(value="/proType.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public ModelAndView proType(HttpSession session) {
		//查询分类
		ProductTypeModel productType=new ProductTypeModel();
		productType.setOrderBy(Constants.ORDER_A);
		productType.setSortField("orderby");
		List<ProductTypeModel> typelist=productService.loadList(productType);
		//存到session中，如果修改或者删了了，就再存一遍，
		session.setAttribute("typelist", typelist);
		//遍历集合，把一级分类获取到
		List<ProductTypeModel> onetypelist=new ArrayList<ProductTypeModel>();
		for (ProductTypeModel productTypeModel : typelist) {
			if("0000".equals(productTypeModel.getParentcode())) {
				onetypelist.add(productTypeModel);
			}
		}
		JSONArray jonetypelist=JSONArray.fromObject(onetypelist);
		ModelAndView mav=new ModelAndView();
		mav.addObject("jonelist", jonetypelist.toString());
		mav.setViewName("/seller/protype");
		return mav;
	}
	
	
	/**
	 * 插入类型
	 * @param productType
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/insertType.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public String insertType(ProductTypeModel productType,HttpSession session) {
		//现再对象中有 typename，parentcode，orderby
		//id,  code, descr, , createtime, updatetime, creator, updater, isdelete, iseffect
		productType.setId(null);
		productType.setCode("t"+Tool.getDateTimeNoLine());
		productType.setCreatetime(Tool.getDateTime());
		productType.setCreator(Constants.CREATOR);
		productType.setIsdelete(Constants.DELETE_N);
		productType.setIseffect(Constants.EFFECT_Y);
		productService.insertType(productType);
		
		return "redirect:/ProductController/proType.do";
	}	
	
	/**删除类型
	 * @param productType 根据code删除
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/deleteType.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public String deleteType(ProductTypeModel productType) {
		//现在对象中有code
		productService.deleteType(productType);
		return "redirect:/ProductController/proType.do";
	}
	
	
	/**修改类型，如果二级分类填了，就修改二级的，如果没填，就修改一级的
	 * @param productType
	 * @return
	 */
	@RequestMapping(value="/updateType.do",method = {RequestMethod.GET,RequestMethod.POST},produces="application/text;charset=utf-8")
	public String updateType(ProductTypeModel productType) {
		//现在对象中有code
		if("two".equals(productType.getCode())) {
			productType.setCode(productType.getParentcode());
		}
		productService.updateType(productType);
		return "redirect:/ProductController/proType.do";
	}	
}
