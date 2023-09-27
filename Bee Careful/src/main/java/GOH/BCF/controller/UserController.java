package GOH.BCF.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import GOH.BCF.mapper.BCFMapper;
@Controller
public class UserController {
	@Autowired
	private BCFMapper mapper;
	
	
}
