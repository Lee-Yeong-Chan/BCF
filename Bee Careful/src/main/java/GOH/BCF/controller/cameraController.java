package GOH.BCF.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import GOH.BCF.entity.UserDTO;
import GOH.BCF.entity.cameraDTO;
import GOH.BCF.mapper.cameraMapper;
@RestController
public class cameraController {
	@Autowired
	private cameraMapper mapper;
	@GetMapping("/userallcamera")
	public List<cameraDTO> userallcamera(HttpSession session){
		List <cameraDTO> DTO=mapper.userallcamera(((UserDTO)session.getAttribute("loginMember")).getUser_id());
		return DTO;
	}
	
}