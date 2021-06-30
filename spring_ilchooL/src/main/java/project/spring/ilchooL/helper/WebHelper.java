package project.spring.ilchooL.helper;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebHelper {
    /** 기본 인코딩 타입 설정 */
    private String encType;

    /** JSP의 request 내장 객체 */
    // --> import javax.servlet.http.HttpServletRequest;
    private HttpServletRequest request;

    /** JSP의 response 내장 객체 */
    // --> import javax.servlet.http.HttpServletResponse;
    private HttpServletResponse response;

    // ----------- 싱글톤 객체 생성 시작 ----------
    /**
     * 싱글톤 객체가 생성될 때 호출되는 메서드로 JSP의 주요 내장객체를 멤버변수에 연결한다.
     *
     * @param request
     * @param response
     */
    public void init(HttpServletRequest request, HttpServletResponse response) {
        this.request = request; // JSP 내장객체 참조하기
        this.response = response; // JSP 내장객체 참조하기

        String methodName = request.getMethod(); // GET방식인지, POST방식인지 조회한다.
        String url = request.getRequestURL().toString(); // 현재 URL을 획득한다.
        String queryString = request.getQueryString(); // URL에서 "?"이후의 GET파라미터 문자열을 모두 가져온다.

        if (queryString != null) { // 가져온 값이 있다면 URL과 결합하여 완전한 URL을 구성한다.
            url = url + "?" + queryString;
        }

        log.debug(String.format("[%s] %s", methodName, url)); // 획득한 정보를 로그로 표시한다.

        /** 내장객체 초기화 -> utf-8 설정 */
        // --> import java.io.UnsupportedEncodingException;
        try {
            this.request.setCharacterEncoding(this.encType);
            this.response.setCharacterEncoding(this.encType);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    /** Getter, Setter 메서드 */
    public String getEncType() { return encType; }

    public void setEncType(String encType) { this.encType = encType; }

    public HttpServletRequest getRequest() { return request; }

    public void setRequest(HttpServletRequest request) { this.request = request; }

    public HttpServletResponse getResponse() { return response; }

    public void setResponse(HttpServletResponse response) { this.response = response; }

    /**
     * 메시지 표시 후, 페이지를 지정된 곳으로 이동한다.
     *
     * @param url - 이동할 페이지의 URL, Null일 경우 이전페이지로 이동
     * @param msg - 화면에 표시할 메시지. Null일 경우 표시 안함
     * @return ModelAndView
     */
    public ModelAndView redirect(String url, String msg) {

        // 획득한 정보를 로그로 표시한다.
        log.debug(String.format(" --> [redirect] %s >> %s", url, msg));

        // 가상의 View로 만들기 위한 HTML 태그 구성
        String html = "<!doctype html>";
        html += "<html>";
        html += "<head>";
        html += "<meta charset='" + this.encType + "'>";

        // 메시지 표시
        if (msg != null) {
            html += "<script type='text/javascript'>alert('" + msg + "');</script>";
        }

        // 페이지 이동
        if (url != null) {
            html += "<meta http-equiv='refresh' content='0; url=" + url + "' />";
        } else {
            html += "<script type='text/javascript'>history.back();</script>";
        }

        html += "</head>";
        html += "<body></body>";
        html += "</html>";

        return this.virtualView(html);
    }	// end redirect()

    /**
     * 파라미터로 받은 내용을 가상의 View로 생성후 리턴한다.
     * 브라우저에게 전달할 HTML,CSS,JS 조합을 출력하기 위해 사용한다.
     * @param body - 브라우저에게 전달할 HTML,CSS,JS 조합 문자열
     * @return ModelAndView
     */
    public ModelAndView virtualView(final String body) {
        /** 가상의 View를 익명 클래스 방식으로 생성하여 리턴 */
        // --> import org.springframework.web.servlet.View;
        // --> import org.springframework.web.servlet.view.AbstractView;
        View view = new AbstractView() {
            @Override
            protected void renderMergedOutputModel(Map<String, Object> map,
                    HttpServletRequest request, HttpServletResponse response) throws Exception {
                PrintWriter out = response.getWriter();
                out.println(body);
                out.flush();
            }	// end renderMergedOutputModel()
        };	// end virtualView()

        // 가상의 뷰를 리턴한다.
        return new ModelAndView(view);
    }	// end virtualView()
    
    /**
     * 전달받은 Map객체에 rt와 pubDate값을 추가한 후 리턴한다.
     * @param statusCode HTTP 결과 코드 (200, 404, 500 등)
     * @param rt	결과 메시지 (성공일 경우 OK, 그 밖의 경우 에러메시지)
     * @param data	JSON으로 변환할 데이터 컬렉션
     * @return	Map<String, Object>
     */
    public Map<String, Object> getJsonData(int statusCode, String rt, Map<String, Object> data) {
		/** 1) JSON 형식 출력을 위한 HTTP 헤더 설정 */
    	// JSON 형식임을 명시함
    	response.setContentType("application/json");
    	// HTTP 상태 코드 설정
    	response.setStatus(statusCode);
    	
    	// CrossDomain에 의한 접근 허용
    	// 보안에 좋지 않기 때문에 이 옵션을 허용할 경우 인증키 등의 보안장치가 필요함
    	this.response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE");
    	this.response.setHeader("Access-Control-Max-Age", "3600");
    	this.response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
    	this.response.setHeader("Access-Control-Allow-Origin", "*");
    	
    	/** 2) 파라미터로 전달된 Map 객체에 rt와 pubDate값을 추가한 새로운 Map 생성하기 */
    	// JSON 생성일시를 위한 현재 시각 문자열 만들기
    	Calendar c = Calendar.getInstance();
    	String pubDate = String.format("%04d-%02d-%02d %02d:%02d:%02d",
    			c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.get(Calendar.DAY_OF_MONTH),
    			c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));
    	
    	// JSON 구성을 위한 컬렉션 객체 생성
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	// 결과 코드 추가
    	map.put("rt", rt);
    	
    	// 생성 일시 추가
    	map.put("pubDate", pubDate);
    	
    	// data가 전달되었다면 map에 병합한다.
    	if (data != null) {
    		map.putAll(data);
    	}
    	
    	return map;
    }	// end getJsonData(int statusCode, String rt, Map<String, Object> data)
    
    /**
     * JSON 형식으로 결과 메시지를 리턴하기 위한 메서드 오버로드
     * HTTP 상태코드는 200으로 설정하고, 결과 메시지는 "OK"라는 값을 설정하여
     * getJsonData(int statusCode, String rt, Map<String, Object> data) 를 호출한다.
     * JSON 으로 표현하고자 하는 컬렉션이 있을 때 사용하는 가장 일반적인 메서드이다.
     * @param data		JSON으로 변환할 데이터 컬렉션
     * @return		Map<Stirng, Object>
     */
    public Map<String, Object> getJsonData(Map<String, Object> data) {
    	return this.getJsonData(200, "OK", data);
    }	// end getJsonData(Map<String, Object> data)
    
    /**
     * JSON 형식으로 결과 메시지를 리턴하기 위한 메서드 오버로드
     * HTTP 상태코드는 200으로 설정하고, 결과 메시지는 "OK"라는 값을 설정하여
     * getJsonData(int statusCode, String rt, Map<String, Object> data) 를 호출한다.
     * 
     * JSON으로 표현하고자 하는 컬렉션이 없지만 처리 결과는 성공인 경우 사용한다.
     * 데이터 쓰기를 수행하고 특별히 조회 결과를 반환하지 않을 경우
     * @return		Map<String, Object>
     */
    public Map<String, Object> getJsonData() {
    	return this.getJsonData(200, "OK", null);
    }	// end getJsonData()
    
    /**
     * JSON 형식으로 에러 메시지를 리턴한다.
     * HTTP 상태코드는 500으로 설정하고, 결과 메시지는 파라미터로 전달되는 값을 설정하여
     * JSON 문자열을 리턴한다.
     * 
     * Service 구현체에서 예외 발생시 전달하는 에러 메시지 등을 JSON으로 표현할 때 사용
     * @param rt
     * @return		Map<String, Object>
     */
    public Map<String, Object> getJsonError(String rt) {
    	return this.getJsonData(500, rt, null);
    }	// end getJsonError(String rt)
    
    /**
     * JSON 형식으로 잘못된 접근에 대한 경고 메시지를 리턴한다.
     * HTTP 상태코드는 400으로 설정하고, 결과 메시지는 파라미터로 전달되는 값을 설정하여
     * JSON 문자열을 리턴한다.
     * 
     * 파라미터 점검 과정에서 유효성 검증에 통과하지 못한 경우 사용
     * @param rt
     * @return		Map<String, Object>
     */
    public Map<String, Object> getJsonWarning(String rt) {
    	return this.getJsonData(400, rt, null);
    }
}	// end WebHelper
