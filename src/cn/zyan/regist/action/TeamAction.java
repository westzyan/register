package cn.zyan.regist.action;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.zyan.regist.domain.Item;
import cn.zyan.regist.domain.Student;
import cn.zyan.regist.domain.Team;
import cn.zyan.regist.service.StudentService;
import cn.zyan.regist.service.TeamService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TeamAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1111853310632668710L;
	private Team team;
	private String validateCode;//登陆时的验证码
	private TeamService teamService;
	private StudentService studentService;
	private String first;
	
	
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public TeamService getTeamService() {
		return teamService;
	}
	public void setTeamService(TeamService teamService) {
		this.teamService = teamService;
	}
	
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public String qisiren(){
		System.out.println("woshi team de name:"+ team.getName());
		teamService.save(team);
		ServletActionContext.getRequest().setAttribute("message","注册成功，请登录去添加队员");
		return "success";
	}
	public String checkTeam() throws IOException{
		HttpServletRequest request = (HttpServletRequest) ActionContext
                .getContext()
                .get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		String name = request.getParameter("name");//获取
		System.out.println("woshi name"+name);
		boolean flag = teamService.find(name);
		System.out.println("woshifaxianl name:"+flag);
		HttpServletResponse response=  ServletActionContext.getResponse();  
	    response.setContentType("text/html;charset=UTF-8");  
	    if(flag){  
	        //存在  
	        response.getWriter().println("<font color='red'>该队名已被占用</font>");  
	    }else{  
	        response.getWriter().println("<font color='green'>该队名可以使用</font>");  
	    }  
		return NONE;
	}
	public String login(){
		Object obj = ActionContext.getContext().getSession().get("code");
		String code = obj==null?"":obj.toString();
		System.out.println("yanzhengma"+code);
		if(code.equalsIgnoreCase(this.validateCode))
		{
			if(teamService.login(team.getName(), team.getPassword()))
			{
				Team te = teamService.findTeam(team.getName());
				ActionContext.getContext().getSession().put("team", te);
				return SUCCESS;
			}
			else
			{
				this.addActionMessage("登录失败，账号密码错误,或者是账户未激活");
				//ServletActionContext.getRequest().setAttribute("message","登录失败，可能是账户未激活");
			}
		}
		else
		{
			this.addActionMessage("校验码错误");
			//ServletActionContext.getRequest().setAttribute("message","校验码出错");
		}
		return NONE;
	}
	
	public String addStudent(){
		Object o = ActionContext.getContext().getSession().get("team");
		String name = ((Team)o).getName();
		if(teamService.findTeam(name).getStudent1Set().size()<=3){
			Student stu1 = studentService.findByNumber(first);
			
			
			if(stu1==null){
				this.addActionMessage("学生尚未注册，请注册后添加");
				System.out.println("xueshengzhuce,tianjia ");
			}else {
				Team t = teamService.findTeam(name);
				if(t.getStudent1Set().contains(stu1)){
					this.addActionMessage("学生已经在队伍中");
					System.out.println("yijingzaiduiwuzhong ");
				}else{
					t.getStudent1Set().add(stu1);
					teamService.update(t);
					ServletActionContext.getRequest().setAttribute("message","添加成功");
					return "success";
				}
			}
		}else{
			this.addActionMessage("队员已满，不可添加");
			System.out.println("manle");
		}
		
		return NONE;
	}
	public String allStudent(){
		Object o = ActionContext.getContext().getSession().get("team");
		Team team = (Team) o;
		Team t = teamService.findTeam(team.getName());
		Set<Student> set = t.getStudent1Set();
		ServletActionContext.getRequest().setAttribute("set",set);
		return "success";
	}
	
	public String stuDelete(){
		String id = ServletActionContext.getRequest().getParameter("sid");
		Student stu = studentService.findByNumber(id);
		Object o = ActionContext.getContext().getSession().get("team");
		Team team = (Team) o;
		Team t = teamService.findTeam(team.getName());
		System.out.println("woshi team "+t);
		t.getStudent1Set().remove(stu);
		System.out.println("移除之后："+t.getStudent1Set().contains(stu));
		teamService.update(t);
		
		Team t1 = teamService.findTeam(team.getName());
		for(Student s:t1.getStudent1Set()){
			System.out.println("woshi stu de name"+s.getName());
		}
		ServletActionContext.getRequest().setAttribute("message","删除成功");
		return "success";
	}
	/**
	 * 团队查看自己所有报名的项目
	 * @return
	 */
	public String all(){
		Team team =(Team)ActionContext.getContext().getSession().get("team");
		Team t = teamService.findTeam(team.getName());
		Item item = t.getItem();
		System.out.println("item shi :"+item);
		System.out.println("item de item shi :"+item);
		ServletActionContext.getRequest().setAttribute("item",item);
		return "success";
	}
	public String withdrawal(){
		
		Team team =(Team)ActionContext.getContext().getSession().get("team");
		Team t = teamService.findTeam(team.getName());
		t.setItem(null);
		teamService.update(t);
		ServletActionContext.getRequest().setAttribute("message","推选成功");
		return "message";
	}
	
}
