package com.shinhan.memento.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        String requestURI = request.getRequestURI();
        log.info("인증 체크 인터셉터 실행: {}", requestURI);

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loginUser") == null) {
            log.info("미인증 사용자 요청 -> 메인 페이지로 리다이렉트");
            
            // 올바른 리다이렉트 경로: [컨텍스트 경로] + / + ? + [파라미터]
            response.sendRedirect(request.getContextPath() + "/mainpage/?loginRequired=true"); 
            
            return false;
        }

        log.info("인증된 사용자 -> 요청 계속 진행");
        return true;
    }
}