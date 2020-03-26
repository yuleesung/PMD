package com.pmd.drm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.UserVO;

import mybatis.dao.BulletinDAO;

@Controller
public class CallBackAction {
	
	@Autowired
	private BulletinDAO b_dao;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("/callback.inc")
	public ModelAndView callBack(String code, String state) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 로그인을 성공한 이후 access_token을 얻기위한 url문자열
		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=YeX1APr9UJODbfW6etcy&client_secret=xQiEEI7UVz&code="+code+"&state="+state;
		
		// System.out.println(apiUrl);
		
		URL url = new URL(apiUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br = null;
		if(responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		String inputLine = "";
		StringBuffer sb = new StringBuffer();
		while((inputLine = br.readLine()) != null) {
			// JSON형식으로 응답이 옴. {"access_token":" ", "refresh_token":" ", "token_type":" ", "expires_in":" "}
			sb.append(inputLine);
		}
		br.close();
		if(responseCode == 200) {
			JSONParser jsonParse = new JSONParser();
			
			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			JSONObject jsonObj = (JSONObject) jsonParse.parse(sb.toString());
			
			// System.out.println(jsonObj.get("access_token"));
			// System.out.println(jsonObj.get("refresh_token"));
			// System.out.println(jsonObj.get("token_type"));
			// System.out.println(jsonObj.get("expires_in"));
			String access_token = (String) jsonObj.get("access_token");
			String refresh_token = (String) jsonObj.get("refresh_token");
			String token_type = (String) jsonObj.get("token_type");
			String expires_in = (String) jsonObj.get("expires_in");
			
			// 프로필 정보를 얻기 위한 링크 문자열
			String apiUrl2 = "https://openapi.naver.com/v1/nid/me";
			String header = "Bearer "+access_token;
			Map<String, String> requestHeaders = new HashMap<String, String>();
			requestHeaders.put("Authorization", header);
			
			// JSON형식으로 응답이 온 것을 responseBody에 넣음.
			String responseBody = get(apiUrl2, requestHeaders);
			
			// System.out.println(responseBody);
			
			JSONObject jsonObj2 = (JSONObject) jsonParse.parse(responseBody);
			
			String resultcode = (String) jsonObj2.get("resultcode");
			String message = (String) jsonObj2.get("message");
			
			// 접근 성공시 아래를 수행
			if(resultcode.equals("00") && message.equals("success")) {
				// System.out.println(jsonObj2.get("response"));
				
				// JSON으로 넘어온 프로필 정보를 뽑아서 String으로 넣어줌
				JSONObject jsonObj3 =  (JSONObject) jsonObj2.get("response");
				String u_name = (String) jsonObj3.get("name");
				String nickname = (String) jsonObj3.get("nickname");
				String sns_id = (String) jsonObj3.get("id");
				String email = (String) jsonObj3.get("email");
				String sns_profile = (String) jsonObj3.get("profile_image");
				
				Map<String, String> map = new HashMap<String, String>();
				map.put("u_name", u_name);
				map.put("nickname", nickname);
				map.put("sns_id", sns_id);
				map.put("email", email);
				map.put("sns_profile", sns_profile);
				map.put("sns_type", "naver");
				// System.out.println(name+"/"+nickname+"/"+id+"/"+email);
				
				UserVO vo = b_dao.naverLogin(sns_id);
				
				if(vo == null) {
					boolean chk = b_dao.naverReg(map);
					vo = b_dao.naverLogin(sns_id);
					session.setAttribute("userInfo", vo);
				}else {
					session.setAttribute("userInfo", vo);
				}				
				mv.setViewName("redirect:/main.inc");
				
			} else {
				mv.setViewName("redirect:/login.inc");
			}
		}
			
		return mv;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
}
