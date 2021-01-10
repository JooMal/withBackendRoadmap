package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.dao.BookDAO;
import com.servlet.dto.BookDTO;

@WebServlet("/bs")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 생성만 하면 드라이버가 로딩된다.
		BookDAO bookDAO = new BookDAO();
		ArrayList<BookDTO> list = bookDAO.select();
		
		out.println(list.size());
		for (int i = 0; i < list.size(); i++) {
			BookDTO dto = list.get(i);
			
			// dto의 getter를 사용하여 받아온 데이터를 변환해준다.
			int bookId = dto.getBookId();
			String bookName = dto.getBookName();
			String bookLoc = dto.getBookLoc();
			
			out.println("bookId : " + bookId + ", bookName : " + bookName
					+ ", bookLoc : " + bookLoc + "<br>");
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
