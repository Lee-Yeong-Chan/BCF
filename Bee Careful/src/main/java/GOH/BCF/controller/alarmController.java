package GOH.BCF.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		List <alarmDTO> DTO=mapper.userallalarm(((UserDTO)session.getAttribute("loginMember")).getUser_id());
		return DTO;
	}
	@GetMapping("/allalarm")
	public List<alarmDTO> allalarm(){
		List <alarmDTO> DTO=mapper.allalarm();
		return DTO;
	}
	@DeleteMapping("/allalarm/{idx}")
	public void alarmdelete(@PathVariable int idx){
		mapper.alarmdelete(idx);
	}
	@PostMapping("/alarmset")
	public void alarminsert(@RequestBody alarmDTO DTO) {
		mapper.alarminsert(DTO);
	}
}