package GOH.BCF.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import GOH.BCF.mapper.weatherMapper;
@Controller
public class WeatherController {
	@Autowired
	private weatherMapper mapper;
	@GetMapping("/weather.do")
	public String main() {
		return "weather";
	}
}