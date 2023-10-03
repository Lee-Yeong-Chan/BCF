package GOH.BCF.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class WeatherController {
	@GetMapping("/weather.do")
	public String main() {
		return "weather";
	}
}