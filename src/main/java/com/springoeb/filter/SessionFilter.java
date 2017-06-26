package com.springoeb.filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@WebFilter(urlPatterns = "/*")
@Component("SessionFilter")
public class SessionFilter implements Filter {
//    private static final Set<String> ALLOW_PATHS = Collections.unmodifiableSet(new HashSet<>(
//            Arrays.asList("/login.jsp", "/loginpage", "/system/login", "/system/logout")));
//
//    private final static String attributeName = "branchowner";

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        HttpSession hs = request.getSession();
        hs.setAttribute("branchno",1);
        filterChain.doFilter(request,response);
    }

    public void destroy() {

    }
}
