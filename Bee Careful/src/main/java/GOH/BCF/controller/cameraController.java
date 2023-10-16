package GOH.BCF.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import GOH.BCF.entity.UserDTO;
import GOH.BCF.entity.alarmDTO;
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
	@GetMapping("/allcamera/{user_id}")
	public List<cameraDTO> allcamera(@PathVariable String user_id){
		List <cameraDTO> DTO=mapper.userallcamera(user_id);
		return DTO;
	}
	@GetMapping("/userfind/{idx}")
	public cameraDTO userfind(@PathVariable int idx){
		cameraDTO DTO=mapper.userfind(idx);
		return DTO;
	}
	@PutMapping("/cameraset")
	public void cameraupdate(@RequestBody cameraDTO DTO){
		if (DTO.getUser_id()!=null) {
			cameraDTO update=new cameraDTO();
			update.setCamera_idx(DTO.getCamera_idx());
			update.setUser_id(DTO.getUser_id());
			mapper.cameraUpdateId(update);
		}
		if (DTO.getCamera_status()!=null) {
			cameraDTO update=new cameraDTO();
			update.setCamera_idx(DTO.getCamera_idx());
			update.setCamera_status(DTO.getCamera_status());
			mapper.cameraUpdateSt(update);
		}
	}
	@DeleteMapping("/cameraset/{idx}")
	public void cameradelete(@PathVariable int idx){
		mapper.cameradelete(idx);
	}
	@PostMapping("/cameraset")
	public void camerainsert(@RequestBody cameraDTO DTO) {
		mapper.camerainsert(DTO);
	}
	@PutMapping("/cameraalarm")
	public void cameraalarm(@RequestBody cameraDTO DTO) {
		mapper.cameraUpdate(DTO);
	}
	
}