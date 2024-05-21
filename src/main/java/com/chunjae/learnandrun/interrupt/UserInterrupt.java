package com.chunjae.learnandrun.interrupt;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterrupt implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Logger logger = LoggerFactory.getLogger("UserInterrupt.class");
        logger.info("pre");
        HttpSession session = request.getSession(false);
        if(session==null || session.getAttribute("dto")==null){
            response.sendRedirect("/user_login");
            return false;
        }
        return true;

    }
}
