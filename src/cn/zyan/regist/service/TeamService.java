package cn.zyan.regist.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.zyan.regist.dao.TeamDao;
import cn.zyan.regist.domain.Item;
import cn.zyan.regist.domain.Team;
//@Transactional
public class TeamService {
	private TeamDao teamDao;

	public TeamDao getTeamDao() {
		return teamDao;
	}

	public void setTeamDao(TeamDao teamDao) {
		this.teamDao = teamDao;
	}
	
	public void save(Team team){
		teamDao.save(team);
	}
	public void update(Team team){
		teamDao.update(team);
	}
	public boolean login(String name,String password){
		return teamDao.login(name, password);
	}
	public boolean find(String name){
		return teamDao.find(name);
	}
	public Team findTeam(String name){
		return teamDao.findTeam(name);
	}
	public List<Team> findTeamByItem(Item item){
		return teamDao.findTeamByItem(item);
	}
}
