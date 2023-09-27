package GOH.BCF.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import GOH.BCF.entity.LogVO;
import GOH.BCF.entity.MemberVO;
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
	
	@RequestMapping("/memberInfo.do")
	public void memberInfo() {}
	
	// Form태그에 값을 담아서 요청을 보내옴
	@RequestMapping("memberInsert.do")
	public String memberInsert(MemberVO vo) { 
		
		mapper.memberInsert(vo); // 받아온 vo를 메소드에 연결
		// Spring에서 한글 주고 받을 때 인코딩 설정 : web.xml - filter태그
		
		// 이미 일을 했던 메소드를 다시 실행
		// redirect:/를 앞에 입력하면 내용이 viewResolver로 가지 않는다.
		return "redirect:/login.do"; // login로 이동시키기
	}
	
}
