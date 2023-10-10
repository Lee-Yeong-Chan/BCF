
package GOH.BCF.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import GOH.BCF.entity.pageVO;
import GOH.BCF.entity.zip_codeVO;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@RestController
public class addressController {
    // 인증키
    public static final String ZIPCODE_API_KEY = "whhMUayf+oiFgJUUFoiZUq0esQV2aub8GGuKupVfHm2mXmT1TAj+TlSyxDtJfbaWCJpJEQNOfMXfhBz8Wrtveg==";
    // api를 쓰기 위한 주소
    public static final String ZIPCODE_API_URL = "http://openapi.epost.go.kr/postal/retrieveNewAdressAreaCdSearchAllService/retrieveNewAdressAreaCdSearchAllService/getNewAddressListAreaCdSearchAll";

    @RequestMapping(value = "/addressController", method = RequestMethod.POST, produces = "application/xml;charset=UTF-8")
    public @ResponseBody String zip_codeList(@RequestParam("query") String query,
           @RequestParam("pageNo") int pageNo, Model model) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        StringBuilder queryUrl = new StringBuilder();
        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?ServiceKey=");
        queryUrl.append(URLEncoder.encode(ZIPCODE_API_KEY, "UTF-8")); // 서비스 키를 URL 인코딩
        queryUrl.append("&srchwrd=");
        queryUrl.append(query);
        queryUrl.append("&countPerPage=5"); // 페이지당 출력될 개수를 지정(최대50)  
        // 페이지 번호를 쿼리에 추가
        queryUrl.append("&currentPage="+pageNo);
        
        // document 선언
        Document document = Jsoup.connect(queryUrl.toString()).get();
        Elements elements = document.select("NewAddressListResponse");
        Elements elementsPage = elements.select("cmmMsgHeader");
        Elements elementsAddr = elements.select("newAddressListAreaCdSearchAll");
        
        List<zip_codeVO> list = new ArrayList<zip_codeVO>();
        zip_codeVO zip_codeVO = null;
        pageVO pageVO = null;
        
        pageVO = new pageVO();

        // 전체 페이지 번호
        pageVO.setTotalPage(Integer.valueOf(elementsPage.select("totalPage").text()));
        System.out.println(pageVO.getTotalPage());

        System.out.println(queryUrl);

        // 페이지의 결과를 list에 추가
        for (Element element : elementsAddr) {
            zip_codeVO = new zip_codeVO();
            zip_codeVO.setzipNo(element.select("zipNo").text());
            zip_codeVO.setlnmAdres(element.select("lnmAdres").text());
            zip_codeVO.setRnAdres(element.select("rnAdres").text());
            list.add(zip_codeVO);
        }

        // 현재 페이지의 결과를 모두 가져왔으면 다음 페이지를 요청하기 위해 페이지 번호를 URL에서 제거
        queryUrl.delete(queryUrl.indexOf("&currentPage="), queryUrl.length());

        paramMap.put("list", list);
        paramMap.put("totalPage", pageVO.getTotalPage());
        
        // 모델에 totalPage 정보 추가
        model.addAttribute("totalPage", pageVO.getTotalPage());
        // Gson형태로 paramMap 리턴
        return (new Gson()).toJson(paramMap);
    }
    
}