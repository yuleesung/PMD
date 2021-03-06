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
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.MakePath;
import com.pmd.vo.UserVO;

import mybatis.dao.UsersDAO;

@Controller
public class CallBackAction {
	
	private final String CLIENT_ID = "YeX1APr9UJODbfW6etcy";
	private final String CLIENT_SECRET = "xQiEEI7UVz";
	private String access_token;
	private String refresh_token;
	
	@Autowired
	private UsersDAO u_dao;
	
	@Autowired
	private HttpSession session;
	

	@RequestMapping("/callback.inc")
	public ModelAndView callBack(String code, String state) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 로그인을 성공한 이후 access_token을 얻기위한 url문자열
		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET+"&code="+code+"&state="+state;
		
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
			access_token = (String) jsonObj.get("access_token");
			refresh_token = (String) jsonObj.get("refresh_token");
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
				
				Map<String, String> social = new HashMap<String, String>();
				social.put("sns_id", sns_id);
				social.put("sns_type", "naver");
				
				UserVO vo = u_dao.socialLogin(social);
				
				if(vo == null) { // 네이버 연동을 한 적이 없거나, 연동해제를 한 경우
					UserVO check = u_dao.socialCheck(social);
					
					if(check == null) { // 네이버 연동을 한 적이 없는 경우
						boolean chk = u_dao.socialReg(map); // 회원가입하기
						vo = u_dao.socialLogin(social);
						session.setAttribute("userInfo", vo);
					}else { // 네이버 연동해제를 한 경우
						boolean chk = u_dao.socialReReg(social); // 탈퇴되었던 회원정보 되살리기
						vo = u_dao.socialLogin(social);
						session.setAttribute("userInfo", vo);
					}
				}else { // 네이버 연동이 되어 있는 경우
					session.setAttribute("userInfo", vo);
				}				
				
				MakePath mp = new MakePath();
				
				mv.setViewName(mp.decidePath(session));
					
			} else {
				mv.setViewName("redirect:/login.inc");
			}
		} else {
			mv.setViewName("redirect:/login.inc");
		}
			
		return mv;
	}
	
	@RequestMapping("/naverLeave.inc") // 네이버 연동 해제시
	public ModelAndView naverLeave() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(access_token == null) {
			String apiUri = "https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET+"&refresh_token="+refresh_token;
			URL url = new URL(apiUri);
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
				
				JSONObject jsonObj = (JSONObject) jsonParse.parse(sb.toString());
				String re_access_token = (String) jsonObj.get("access_token"); // 네이버 연동 갱신에 성공했을 때
				if(re_access_token != null) {
					String re_apiUri = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET+"&access_token="+re_access_token;
					URL re_url = new URL(re_apiUri);
					mv.setViewName(naverLeaveConnection(re_url));
				}else {
					mv.setViewName("redirect:/login.inc");
				}
				
			}else {
				mv.setViewName("redirect:/login.inc");
			}
			
		}else {
			String apiUri = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET+"&access_token="+access_token+"&service_provider=NAVER";
			URL url = new URL(apiUri);
			mv.setViewName(naverLeaveConnection(url));
		}
		
		return mv;
	}
	
	@RequestMapping("/kakaoLogin.inc")
	public ModelAndView kakaoLogin(String sns_id, String nickname, String email) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> kakaoLogin = new HashMap<String, String>();
		kakaoLogin.put("sns_id", sns_id);
		kakaoLogin.put("sns_type", "kakao");
		
		UserVO vo = u_dao.socialLogin(kakaoLogin);
		
		if(vo == null) { // 카카오 연동이 안 되어있거나, 연동해제되어 있을 경우
			UserVO check = u_dao.socialCheck(kakaoLogin);
			
			if(check != null) { // DB에 정보가 남아있는 경우
				u_dao.socialReReg(kakaoLogin);
				vo = u_dao.socialLogin(kakaoLogin);
				session.setAttribute("userInfo", vo);
			}else { // 카카오 연동이 되어있지 않은 경우
				Map<String, String> kakaoReg = new HashMap<String, String>();
				kakaoReg.put("sns_id", sns_id);
				kakaoReg.put("nickname", nickname);
				kakaoReg.put("email", email);
				kakaoReg.put("sns_type", "kakao");
				
				u_dao.socialReg(kakaoReg);
				
				vo = u_dao.socialLogin(kakaoLogin);
				session.setAttribute("userInfo", vo);
			}
		}else { // 카카오 연동이 되어 있는경우
			session.setAttribute("userInfo", vo);
		}
		
		MakePath mp = new MakePath();
		mv.setViewName(mp.decidePath(session));
		
		return mv;
	}
	
	@RequestMapping(value = "/disconnectKakao.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> disconnectKakao(String sns_id){
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, String> discon = new HashMap<String, String>();
		discon.put("sns_id", sns_id);
		discon.put("sns_type", "kakao");
		
		boolean chk = u_dao.socialLeave(discon);
		session.removeAttribute("userInfo");
		
		map.put("chk", chk);
		
		return map;
	}
	
	@RequestMapping(value = "/googleLogin.inc", method = RequestMethod.POST)
	public ModelAndView googleLogin(String sns_id, String nickname, String email) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> googleLogin = new HashMap<String, String>();
		googleLogin.put("sns_id", sns_id);
		googleLogin.put("sns_type", "google");
		
		UserVO vo = u_dao.socialLogin(googleLogin);
		
		if(vo == null) { // 구글 연동이 안 되어있거나, 연동해제되어 있을 경우
			UserVO check = u_dao.socialCheck(googleLogin);
			
			if(check != null) { // DB에 정보가 남아있는 경우
				u_dao.socialReReg(googleLogin);
				vo = u_dao.socialLogin(googleLogin);
				session.setAttribute("userInfo", vo);
			}else { // 구글 연동이 되어있지 않은 경우
				Map<String, String> googleReg = new HashMap<String, String>();
				googleReg.put("sns_id", sns_id);
				googleReg.put("nickname", nickname);
				googleReg.put("email", email);
				googleReg.put("sns_type", "google");
				
				u_dao.socialReg(googleReg);
				
				vo = u_dao.socialLogin(googleLogin);
				session.setAttribute("userInfo", vo);
			}
		}else { // 구글 연동이 되어 있는경우
			session.setAttribute("userInfo", vo);
		}
		
		MakePath mp = new MakePath();
		mv.setViewName(mp.decidePath(session));
		
		return mv;
	}
	
	private String naverLeaveConnection(URL url) throws Exception {
		String returnPage = null;
		
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
			sb.append(inputLine);
		}
		br.close();
		if(responseCode == 200) {
			JSONParser jsonParse = new JSONParser();
			
			JSONObject jsonObj = (JSONObject) jsonParse.parse(sb.toString());
			String result = (String) jsonObj.get("result"); // 네이버 연동해제(탈퇴)를 성공했을 때
			if(result.equals("success")) {
				UserVO vo = (UserVO) session.getAttribute("userInfo");
				String sns_id = vo.getSns_id();
				
				Map<String, String> map = new HashMap<String, String>();
				map.put("sns_id", sns_id);
				map.put("sns_type", "naver");
				
				boolean chk = u_dao.socialLeave(map); // DB에서 탈퇴로 변경
				session.removeAttribute("userInfo"); // 세션에서 로그아웃 처리
				returnPage = "redirect:/main.inc";
			}else {
				returnPage = "redirect:/login.inc";
			}
			
		}else {
			returnPage = "redirect:/login.inc";
		}
		
		return returnPage;
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
