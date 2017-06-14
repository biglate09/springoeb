package com.springoeb.filter;

import com.springoeb.employee.model.Branch;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
@Component("SessionFilter")
public class SessionFilter implements Filter{
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpSession session = request.getSession();
        Branch b = new Branch();
        b.setBranchNo(1);
        session.setAttribute("branch",b);
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {

    }
}
