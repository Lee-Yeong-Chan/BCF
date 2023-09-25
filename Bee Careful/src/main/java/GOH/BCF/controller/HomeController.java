package GOH.BCF.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import GOH.BCF.entity.LogVO;
import GOH.BCF.mapper.BCFMapper;
 

@Controller
public class HomeController {

	@Autowired
	private BCFMapper mapper;
	
	@GetMapping("/login.do")
	public String LogSelect(LogVO vo, Model model) {
		String ret=null;
		int n =mapper.LogSelect(vo);
		if(n==1) {
			ret="menu";
		}
		else {
			ret="login";
		}
		model.addAttribute("Id", vo.getId());
		return ret;
	}
	
}
