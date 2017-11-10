package com.springoeb.system.filter;

import com.springoeb.system.model.BranchUser;
import com.springoeb.system.service.BranchUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Component("SessionFilter")
public class SessionFilter implements Filter {
    private static final Set<String> ALLOW_PATHS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("/login.jsp", "/404error.jsp", "/WEB-INF/setuser.jsp", "/loginpage", "/system/login", "/system/logout", "/system/dummyorder")));
    private static final Set<String> START_PATHS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("/system/register","/system/registeruserprocess","/system/registeremp","/system/registerempprocess","/images","/vendors","/build")));
    private final static String SESSION_NAME = "branchUser";
    private final static String COOKIE_NAME = "username";

    @Autowired
    private BranchUserService branchUserService;

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession hs = request.getSession(false);
        String path = request.getRequestURI().substring(request.getContextPath().length()).replaceAll("[/]+$", "");
        boolean loggedIn = (hs != null && hs.getAttribute(SESSION_NAME) != null);
        boolean allowedPath = ALLOW_PATHS.contains(path);
        for(String sp : START_PATHS){
            if(path.startsWith(sp)){
                allowedPath = true;
                break;
            }
        }

        if (!loggedIn) {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals(COOKIE_NAME)) {
                        String username = c.getValue();
                        BranchUser branchUser = branchUserService.findByUsername(username);
                        if (branchUser != null) {
                            if (hs == null) {
                                hs = request.getSession();
                            }
                            hs.setAttribute(SESSION_NAME, branchUser);
                            loggedIn = true;
                        }
                    }
                }
            }
        }


        if (loggedIn || allowedPath) {
            filterChain.doFilter(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    public void destroy() {

    }
}
