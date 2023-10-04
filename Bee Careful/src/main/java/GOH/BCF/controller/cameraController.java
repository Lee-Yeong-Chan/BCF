package GOH.BCF.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import GOH.BCF.mapper.cameraMapper;
@Controller
public class cameraController {
	@Autowired
	private cameraMapper mapper;
	
}