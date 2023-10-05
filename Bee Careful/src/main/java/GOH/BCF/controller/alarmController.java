package GOH.BCF.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import GOH.BCF.entity.UserDTO;
import GOH.BCF.entity.alarmDTO;
import GOH.BCF.mapper.alarmMapper;
@RestController
public class alarmController {
	@Autowired
	private alarmMapper mapper;
	@GetMapping("/userallalarm")
	public List<alarmDTO> userallalarm(HttpSession session){
		List <alarmDTO> DTO=mapper.allalarm(((UserDTO)session.getAttribute("loginMember")).getUser_id());
		return DTO;
	}

}