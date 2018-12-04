package cn.zyan.regist.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.zyan.regist.dao.AdminDao;
import cn.zyan.regist.dao.ItemDao;
import cn.zyan.regist.domain.Item;
import cn.zyan.regist.domain.PageBean;
//@Transactional
public class AdminService {
	private ItemDao itemDao;
	private AdminDao adminDao;
	
	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public ItemDao getItemDao() {
		return itemDao;
	}

	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	
	public void saveItem(Item item){
		itemDao.save(item);
	}
	
	public void updateItem(Item item){
		itemDao.update(item);
	}
	public void deleteItem(Integer id){
		itemDao.deleteItem(id);
	}
	
	public boolean adminLogin(String name,String password){
		return adminDao.login(name, password);
	}
	
	public List<Item> findAllItem(){
		return itemDao.findAllItem();
	}
	
	public Item findItem(Integer id){
		return itemDao.find(id);
	}
	
	/**
	 * 分页查询  
	 * @param pageSize  每页显示多少记录
	 * @param currentPage 当前页
	 * @return 封装了分页信息的bean
	 */
	public PageBean queryForPage(int pageSize, int page) {
		final String hql = "from Item"; //查询语句
		int allRow = itemDao.getAllRowCount(hql);  //总记录数
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page); // 当前页
		List list = itemDao.queryForPage(hql, offset, length); //
		//把分页信息保存到Bean当中
		PageBean pageBean  = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
}
