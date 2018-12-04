package cn.zyan.regist.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.zyan.regist.dao.TeamDao;
import cn.zyan.regist.domain.Item;
import cn.zyan.regist.domain.Student;
import cn.zyan.regist.domain.Team;

public class TeamDaoImpl extends HibernateDaoSupport implements TeamDao{

	@Override
	public void save(Team team) {
		this.getHibernateTemplate().save(team);
	}

	@Override
	public void update(Team team) {
		this.getHibernateTemplate().update(team);
	}

	@Override
	public boolean login(String name, String password) {
		boolean flag = false;
		String hql = "from Team t where t.name = ? and t.password = ?";
		List<Team> list = this.getHibernateTemplate().find(hql,name,password);
		if(list.size() > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean find(String name) {
		boolean flag = false;
		String hql = "from Team t where t.name = ?";
		List<Team> list = this.getHibernateTemplate().find(hql,name);
		if(list.size() > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public Team findTeam(String name) {
		Team t = null;
		String hql = "from Team t where t.name = ?";
		List<Team> list = this.getHibernateTemplate().find(hql,name);
		for(Team team:list){
			 t = team;
		}
		return t;
	}

	@Override
	public List<Team> findTeamByItem(Item item) {
		String hql = "from Team t where t.item = ?";
		List<Team> list = this.getHibernateTemplate().find(hql,item);
		for(Team team:list){
			 System.out.println("我是指定的team"+team);
		}
		return list;
		
	}

}
