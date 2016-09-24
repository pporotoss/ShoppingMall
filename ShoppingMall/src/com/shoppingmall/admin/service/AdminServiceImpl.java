package com.shoppingmall.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.admin.model.Admin;
import com.shoppingmall.admin.model.AdminDAO;
import com.shoppingmall.admin.model.Notice;
import com.shoppingmall.admin.model.NoticeDAO;
import com.shoppingmall.member.model.MemberDAO;
import com.shoppingmall.product.model.BrandDAO;
import com.shoppingmall.product.model.EventInfoDAO;
import com.shoppingmall.product.model.EventProduct;
import com.shoppingmall.product.model.EventProductDAO;
import com.shoppingmall.product.model.NationDAO;
import com.shoppingmall.product.model.PanelSizeDAO;
import com.shoppingmall.product.model.Product;
import com.shoppingmall.product.model.ProductDAO;
import com.shoppingmall.product.model.ProductSize;
import com.shoppingmall.product.model.ProductSizeDAO;
import com.shoppingmall.product.model.SubCategoryDAO;
import com.shoppingmall.product.model.TopCategoryDAO;

import common.exception.DoNotLoginException;
import common.file.FileManager;

@Service
public class AdminServiceImpl implements AdminService{
	private String TAG = this.getClass().getName();
	
	@Autowired
	@Qualifier("adminDAOImpl")
	private AdminDAO adminDAO;
	
	@Autowired
	@Qualifier("brandDAOImpl")
	private BrandDAO brandDAO;
	
	@Autowired
	@Qualifier("nationDAOImpl")
	private NationDAO nationDAO;
	
	@Autowired
	@Qualifier("panelSizeDAOImpl")
	private PanelSizeDAO panelSizeDAO;
	
	@Autowired
	@Qualifier("subCategoryDAOImpl")
	private SubCategoryDAO subCategoryDAO;
	
	@Autowired
	@Qualifier("topCategoryDAOImpl")
	private TopCategoryDAO topCategoryDAO;
	
	@Autowired
	@Qualifier("productDAOImpl")
	private ProductDAO productDAO;
	
	@Autowired
	@Qualifier("productSizeDAOImpl")
	private ProductSizeDAO productSizeDAO;
	
	@Autowired
	@Qualifier("eventInfoDAOImpl")
	private EventInfoDAO eventInfoDAO;
	
	@Autowired
	@Qualifier("eventProductDAOImpl")
	private EventProductDAO eventProductDAO;
	
	@Autowired
	@Qualifier("mybatisMemberDAO")
	private MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("noticeDAOImpl")
	private NoticeDAO noticeDAO;
	
	
	@Override
	public void login(Admin admin, HttpSession session) throws DoNotLoginException{
		
		Admin result = adminDAO.select(admin);
		if(result == null){
			throw new DoNotLoginException("���̵�,�н����带 Ȯ�����ּ���.");
		}
		session.setAttribute("admin", result);
	}
	
	/* �α׾ƿ� */
	@Override
	public void logout(HttpSession session) {
		
		session.removeAttribute("admin");
		
	}
	
	public Map registProduct(){
		
		Map allList = new HashMap();
		
		List brandList = brandDAO.selectAll();
		allList.put("brandList", brandList);
		
		List nationList = nationDAO.selectAll();
		allList.put("nationList", nationList);
		
		List panelSizeList = panelSizeDAO.selectAll();
		allList.put("panelSizeList", panelSizeList);
		
		List topCategoryList = topCategoryDAO.selectAll();
		allList.put("topCategoryList", topCategoryList);
		
		return allList;
	}


	/* ����ī�װ��� ������!! */
	public List getSubCategory(int topCategory_id) {
		
		List subCategoryList = subCategoryDAO.selectAll(topCategory_id);

		return subCategoryList;
	}
	
	
	/* ��ǰ ����ϱ� */
	@Override
	public void insert(Product product, String[] panelsize_id, HttpServletRequest request) {
		
		
		File temp = null;
		// ���Ͼ��ε�
		MultipartFile myFile = product.getMyFile();	// �Ѱܹ��� ���� ��ü ����.
		
		String realname = myFile.getOriginalFilename(); // �Ѱܹ��� ������ �����̸� ����.
		String savePath = request.getServletContext().getRealPath("/data/");
		
		String ext = FileManager.getExtend(realname);
		
		// DB �ֱ�.
		product.setFilename(realname);
		int product_id = productDAO.insert(product);
		
		
		for(int i = 0; i < panelsize_id.length; i++){
			ProductSize productSize = new ProductSize();
			productSize.setProduct_id(product_id);
			productSize.setPanelsize_id(Integer.parseInt(panelsize_id[i]));
			
			productSizeDAO.insert(productSize);
		}
		
		
		
		String fullname = savePath+product_id+"."+ext;
		
		try {
			// �Ѱܹ��� ���� ������ ����.
			myFile.transferTo(temp = new File(fullname));
			// �����
			FileManager.makeThumb(temp, savePath, realname, product_id);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	// ��ü ��ǰ
	@Override
	public List selectAll() {
		
		List list = productDAO.selectAll();
		
		return list;
	}
	
	// �̺�Ʈ ���� ��������
	@Override
	public List eventAll() {
		
		List list = eventInfoDAO.selectAll();
		
		return list;
	}
	
	/* ��ǰ���� */
	@Override
	public void productDelete(String[] product_id, String[] filename, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/data/");
		for(int i = 0; i < product_id.length; i++){
			// ��ǰ����
			productDAO.delete(Integer.parseInt(product_id[i]));
			// �ش��ǰ ������ ����
			productSizeDAO.delete(Integer.parseInt(product_id[i]));
			
			// ��������
			File file = new File(path+product_id[i]+"."+FileManager.getExtend(filename[i]));
			File thumbFile = new File(path+product_id[i]+"_thumb."+FileManager.getExtend(filename[i]));
			file.delete();
			thumbFile.delete();
		}
		
	}
	
	/* �̺�Ʈ��� */
	@Override
	public void eventRegist(String[] product_id, String eventinfo_id) {
		
		for(int i = 0; i < product_id.length; i++){
			
			eventProductDAO.insert(Integer.parseInt(product_id[i]), Integer.parseInt(eventinfo_id));
		}
	}
	
	/* �̺�Ʈ���� */
	@Override
	public List eventSelect(int eventinfo_id) {
		
		List<EventProduct> eventList = eventProductDAO.select(eventinfo_id);
		
		ArrayList<Product> productList = new ArrayList<Product>();
		for(int i = 0; i < eventList.size(); i++){
			EventProduct eventProduct = eventList.get(i);
			
			Product product = productDAO.select(eventProduct.getProduct_id());
			
			productList.add(product);
		}
		
		return productList;
	}

	@Override
	public void eventDelete(String[] product_id, int eventinfo_id) {
		
		for(int i = 0; i < product_id.length; i++){
			eventProductDAO.delete(Integer.parseInt(product_id[i]), eventinfo_id);
		}
		
	}
	
	// �̺�Ʈ �ߺ��˻�
	@Override
	public List duplicateEvent(String[] product_id, int eventinfo_id) {
		
		ArrayList<EventProduct> eventList = new ArrayList<EventProduct>();
		for(int i = 0; i < product_id.length; i++){
			EventProduct event = eventProductDAO.dupleSelect(Integer.parseInt(product_id[i]), eventinfo_id);
			eventList.add(event);
		}
		
		ArrayList<Product> productList = new ArrayList<Product>();
		
		
		for(int i = 0; i < eventList.size(); i++){
			EventProduct eventProduct = eventList.get(i);
			
			if(eventProduct == null){
				return productList;
			}
			
			Product product = productDAO.select(eventProduct.getProduct_id());
			
			productList.add(product);
		}
		
		return productList;
	}
	
	// ȸ�� ��ü �ҷ�����
	@Override
	public List allMember() {
		
		List list = memberDAO.selectAll();
		
		return list;
	}
	
	// �������� �Է�
	@Override
	public void noticeWrite(Notice notice) {
		
		noticeDAO.insert(notice);
		
	}
	
	// �������� ��ü �ҷ�����
	@Override
	public List noticeAll() {
		
		List list = noticeDAO.selectAll();
		
		return list;
	}
	
	// �������� �����ϱ�
	@Override
	public void noticeUpdate(Notice notice) {
		
		noticeDAO.update(notice);
		
	}
	
	// �������� �󼼺���
	@Override
	public Notice noticeOne(int notice_id) {
		
		noticeDAO.updateHit(notice_id);
		Notice notice = noticeDAO.selectOne(notice_id);
		
		return notice;
	}
	
	// �������� �����
	@Override
	public void noticeDelete(int notice_id) {
		
		noticeDAO.delete(notice_id);
		
	}
	
	
	
	
	

}