package GOH.BCF.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import GOH.BCF.entity.UserDTO;
import GOH.BCF.mapper.userMapper;
@RestController
public class adminController {
	@Autowired
	private userMapper mapper;
	@GetMapping("/alluser")
	public List<UserDTO> user(){
		List <UserDTO> DTO=mapper.user();
		return DTO;
	}
	@DeleteMapping("/alluser/{user_id}")
	public void Delete(@PathVariable String user_id) {
		mapper.Delete(user_id);
	}
	@PutMapping("/alluser")
	public void Update(@RequestBody UserDTO DTO) {
		if (DTO.getUser_pw()!=null&&!"".equals(DTO.getUser_pw())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_pw(DTO.getUser_pw());
			mapper.updatePw(update);
		}
		if (DTO.getUser_name()!=null&&!"".equals(DTO.getUser_name())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_name(DTO.getUser_name());
			mapper.updateName(update);
		}
		if (DTO.getUser_email()!=null&&!"".equals(DTO.getUser_email())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_email(DTO.getUser_email());
			mapper.updateEmail(update);
		}
		if (DTO.getUser_phone()!=null&&!"".equals(DTO.getUser_phone())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_phone(DTO.getUser_phone());
			mapper.updatePhone(update);
		}
		if (DTO.getUser_addr()!=null&&!"".equals(DTO.getUser_addr())) {
			UserDTO update=new UserDTO();
			update.setUser_id(DTO.getUser_id());
			update.setUser_addr(DTO.getUser_addr());
			mapper.updateAddr(update);
		}
	}
	@PostMapping("/userInfo/{user_id}")
	public UserDTO userInfo(@PathVariable String user_id){
		UserDTO DTO=mapper.getUser(user_id);
		return DTO;
	}
}
