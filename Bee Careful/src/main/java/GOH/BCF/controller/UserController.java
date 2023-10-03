package GOH.BCF.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import GOH.BCF.entity.UserDTO;
import GOH.BCF.mapper.BCFMapper;
@Controller
public class UserController {
	@Autowired
	private BCFMapper mapper;
	@GetMapping("/main.do")
	public String main() {
		return "main";
	}
	@PostMapping("/login.do")
	public String login(UserDTO DTO, HttpSession session) {
		UserDTO loginMember=mapper.login(DTO);
		String come="redirect:/main.do";
		if (loginMember!=null) {
			session.setAttribute("loginMember", loginMember);
			if(loginMember.getUser_id().equals("admin")) {
				come="management";
			}
			else {
				come="home";
			}
		}
		return come;
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/main.do";
	}
	@RequestMapping("/join.do")
	public void join() {}
	
	@RequestMapping("/check.do")
	@ResponseBody
	public Integer check(@RequestParam String user_id) {
		return mapper.check(user_id);
	}
	@RequestMapping("/insert.do")
	public String insert(UserDTO DTO) {
		mapper.join(DTO);
		return "redirect:/main.do";
	}
}