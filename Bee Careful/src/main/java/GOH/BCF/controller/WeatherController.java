package GOH.BCF.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import GOH.BCF.entity.UserDTO;
import GOH.BCF.mapper.userMapper;
@RestController
public class WeatherController {
	@Autowired
	private userMapper mapper;
	@RequestMapping("/UserAddres.do")
	public UserDTO UserAddres(HttpSession session) {
		UserDTO user = mapper.getAddr(((UserDTO)session.getAttribute("loginMember")).getUser_id());
		return user;
	}
}