package cn.zyan.regist.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.zyan.regist.dao.ItemDao;
import cn.zyan.regist.domain.Item;

public class ItemDaoImpl extends HibernateDaoSupport implements ItemDao {

	@Override
	public void save(Item item) {
		this.getHibernateTemplate().save(item);
	}

	@Override
	public void update(Item item) {
		this.getHibernateTemplate().update(item);
	}

	@Override
	public List<Item> findAllItem() {
		String hql = "from Item";
		return this.getHibernateTemplate().find(hql);
	}

	@Override
	public Item find(Integer id) {
		return this.getHibernateTemplate().get(Item.class, id);
	}
	
	public int getAllRowCount(String hql) {
		return this.getHibernateTemplate().find(hql).size();
	}
	public void deleteItem(Integer id) {
		Item item = this.getHibernateTemplate().get(Item.class, id);
		this.getHibernateTemplate().delete(item);
	}
	
	public List queryForPage(final String hql, final int offset, final int length) {
		
		Session session = this.getSessionFactory().openSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List list = q.list();
		System.out.println(list.size());
		
		return list;
	}

}
