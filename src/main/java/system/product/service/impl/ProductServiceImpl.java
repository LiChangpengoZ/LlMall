package system.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import system.product.mapper.ProductMapper;
import system.product.mapper.ProductTypeMapper;
import system.product.model.ProductModel;
import system.product.model.ProductTypeModel;
import system.product.service.ProductService;
import system.user.model.UserModel;


/**
 * productService的实现类
 * @author 李昌鹏
 */
@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductTypeMapper productTypeMapper;
	
	@Autowired
	ProductMapper productMapper; 
	
	public List<ProductTypeModel> loadList(ProductTypeModel productType) {
		
		List<ProductTypeModel> list= productTypeMapper.select(productType);		
		
		return list;
	}
	
	public List<ProductModel> search(ProductModel product) {
		
		List<ProductModel> list=productMapper.select(product);
		
		return list;
	}

	public int getCount(ProductModel product) {
		int count =productMapper.selectCount(product);
		return count;
	}
	
	public List<ProductModel> sellerLoad(UserModel user) {
		
		return productMapper.selectBySeller(user);
	}

	public boolean updatePro(ProductModel product) {
		Integer isUpdate= productMapper.update(product);
		if(isUpdate !=0) {
			return true;
		}else {
			return false;
		}
	}

	public boolean insertPro(ProductModel product) {
		Integer temp= productMapper.insert(product);
		if(temp!=0) {
			return true;			
		}else {
			return false;
		}
	}


	public void insertType(ProductTypeModel productType) {
		productTypeMapper.insert(productType);
		
	}

	public Integer deleteType(ProductTypeModel productType) {
		return productTypeMapper.delete(productType);
	}

	public Integer updateType(ProductTypeModel productType) {
		
		return productTypeMapper.update(productType);
	}

}
