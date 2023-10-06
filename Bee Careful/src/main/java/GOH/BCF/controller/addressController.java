
package GOH.BCF.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

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

    @RequestMapping(value = "/zip_codeList", method = RequestMethod.POST, produces = "application/xml;charset=UTF-8")
    public @ResponseBody String zip_codeList(@RequestParam("query") String query) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        StringBuilder queryUrl = new StringBuilder();
        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?ServiceKey=");
        queryUrl.append(URLEncoder.encode(ZIPCODE_API_KEY, "UTF-8")); // 서비스 키를 URL 인코딩
        queryUrl.append("&srchwrd=");
        queryUrl.append(query);
        queryUrl.append("&countPerPage=10"); // 페이지당 출력될 개수를 지정(최대50)
        queryUrl.append("&currentPage=1"); // 출력될 페이지 번호 (1로 설정)
        System.out.println(queryUrl);

        // document 선언
        Document document = Jsoup.connect(queryUrl.toString()).get();
        
        System.out.println("검색한 정보 : ");
        System.out.println(document);

        Elements elements = document.select("newAddressListAreaCdSearchAll");
        System.out.println("필요한 정보 : ");
        System.out.println(elements);
        
        List<zip_codeVO> list = new ArrayList<zip_codeVO>();
        zip_codeVO zip_codeVO = null;

        for (Element element : elements) {
            zip_codeVO = new zip_codeVO();
            zip_codeVO.setzipNo(element.select("zipNo").text()); // 우편번호
            zip_codeVO.setlnmAdres(element.select("lnmAdres").text()); // 도로명 주소
            zip_codeVO.setRnAdres(element.select("rnAdres").text());
            System.out.println("우편번호 정보 : ");
            System.out.println(element.select("zipNo").text());
            list.add(zip_codeVO);
        }
        paramMap.put("list", list);
        System.out.println(paramMap);
        System.out.println((new Gson()).toJson(paramMap));
        // Gson형태로 paramMap 리턴
        return (new Gson()).toJson(paramMap);
    }

    
}