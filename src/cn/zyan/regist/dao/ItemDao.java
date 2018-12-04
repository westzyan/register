package cn.zyan.regist.dao;

import java.util.List;

import cn.zyan.regist.domain.Item;

public interface ItemDao {
	public void save(Item item);
	
	public void update(Item item);
	
	public List<Item> findAllItem();
	
	public Item find(Integer id);
	
	/**
	 * 分页查询
	 * @param hql  查询条件
	 * @param offset  开始记录
	 * @param length  一次查询几条记录
	 * @return 查询的记录集合
	 */
	public List queryForPage(final String hql,final int offset,final int length);
	/**
	 * 查询所有的记录数
	 * @param hql 查询条件
	 * @return 总记录数
	 */
	public int getAllRowCount(String hql);

	public void deleteItem(Integer id);
}
