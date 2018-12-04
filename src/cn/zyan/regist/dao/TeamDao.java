package cn.zyan.regist.dao;

import java.util.List;

import cn.zyan.regist.domain.Item;
import cn.zyan.regist.domain.Team;

public interface TeamDao {
	public void save(Team team);
	
	public void update(Team team);
	
	public boolean login(String name,String password);

	public boolean find(String name);

	public Team findTeam(String name);

	public List<Team> findTeamByItem(Item item);
	
}
