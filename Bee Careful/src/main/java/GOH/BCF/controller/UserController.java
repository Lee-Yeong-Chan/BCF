package GOH.BCF.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import GOH.BCF.entity.UserDTO;
import GOH.BCF.mapper.userMapper;
@Controller
public class UserController {
	@Autowired
	private userMapper mapper;
	@GetMapping("/main.do")
	public void main() {
	}
	@PostMapping("/login.do")
	public String login(UserDTO DTO, HttpSession session) {
		UserDTO loginMember=mapper.login(DTO);
		String come="main.do";
		session.setAttribute("msg", "아이디 혹은 비밀번호가 틀립니다.");
		session.setAttribute("url", come);
		if (loginMember!=null&&!loginMember.getUser_id().equals("")) {
			session.setAttribute("loginMember", loginMember);
			if(loginMember.getUser_id().equals("admin")) {
				come="management.do";
				session.setAttribute("msg", "관리자 로그인");
				session.setAttribute("url", come);
			}
			else {
				come="home.do";
				session.removeAttribute("msg");
				session.setAttribute("url", come);
			}
		}
		return "alert";
	}
	@RequestMapping("/management.do")
	public void management(){
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		session.setAttribute("msg", "로그아웃");
		session.setAttribute("url", "main.do");
		return "alert";
	}
	@RequestMapping("/join.do")
	public void join() {
	}
	@RequestMapping("/home.do")
	public void home() {
	}
	@RequestMapping("/check.do")
	@ResponseBody
	public Integer check(@RequestParam String user_id) {
		return mapper.check(user_id);
	}
	@RequestMapping("/insert.do")
	public String insert(UserDTO DTO, HttpSession session) {
		mapper.join(DTO);
		session.setAttribute("msg", "회원가입");
		session.setAttribute("url", "main.do");
		return "alert";
	}
	@GetMapping("/user.do")
	public String mypage() {
		return "user";
	}
	@RequestMapping("/update.do")
	public String update(UserDTO DTO, HttpSession session){
		if (DTO.getUser_pw()!=null&&!"".equals(DTO.getUser_pw())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_pw(DTO.getUser_pw());
			mapper.updatePw(update);
		}
		if (!((UserDTO)session.getAttribute("loginMember")).getUser_name().equals(DTO.getUser_name())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_name(DTO.getUser_name());
			mapper.updateName(update);
		}
		if (!((UserDTO)session.getAttribute("loginMember")).getUser_email().equals(DTO.getUser_email())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_email(DTO.getUser_email());
			mapper.updateEmail(update);
		}
		if (!((UserDTO)session.getAttribute("loginMember")).getUser_phone().equals(DTO.getUser_phone())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_phone(DTO.getUser_phone());
			mapper.updatePhone(update);
		}
		if (!((UserDTO)session.getAttribute("loginMember")).getUser_addr().equals(DTO.getUser_addr())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_addr(DTO.getUser_addr());
			mapper.updateAddr(update);
		}
		session.setAttribute("msg", "회원 정보 수정");
		session.setAttribute("url", "user.do");
		return "alert";
	}
	@RequestMapping("/manuser.do")
	public void manuser() {
	}
	@RequestMapping("/camera.do")
	public void camera() {
	}
	@RequestMapping("/alarm.do")
	public void alarm() {
	}
	@RequestMapping("/useralarm.do")
	public void useralarm() {
	}
	@RequestMapping("/mancamera.do")
	public void mancamera() {
	}
	@RequestMapping("/manalarm.do")
	public void manalarm() {
	}
	@RequestMapping("/statistic.do")
	public void statistic() {
	}
	@RequestMapping("/cut.do")
	public void cut() {
	}
	@GetMapping("/weather.do")
	public String weather() {
		return "weather";
	}
}