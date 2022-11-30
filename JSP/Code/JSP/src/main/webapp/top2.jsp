<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
 <%! 
 	Date today = new Date();
 %>

		<font color="blue" size="3pt">
			top.jsp입니다. <p>
			<%= today.toLocaleString() %>
		</font>
