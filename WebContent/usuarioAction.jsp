<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>


<%

if(request.getParameter("ac").equals("adicionar")){
	
	String nome  = request.getParameter("nome");
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	
	//inserção no banco
	String url = "jdbc:mysql://localhost:3306/crudjsp";
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection(url,"root","");
	Statement stmt = conn.createStatement();
	String sql = "INSERT INTO usuarios(id,nome,login,senha) VALUES('',?,?,?)";
	
	PreparedStatement smtp = conn.prepareStatement(sql);
	
	smtp.setString(1,nome);
	smtp.setString(2,login);
	smtp.setString(3,senha);
	
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close();
}


if(request.getParameter("ac").equals("atualizar")){
		
	int id = Integer.parseInt(request.getParameter("id"));	
	String nome  = request.getParameter("nome");
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	
	//inserção no banco
	String url = "jdbc:mysql://localhost:3306/crudjsp";
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection(url,"root","");
	Statement stmt = conn.createStatement();
	String sql = "UPDATE usuarios SET nome=?, login=?, senha=? WHERE id=?";
	
	PreparedStatement smtp = conn.prepareStatement(sql);
	
	smtp.setString(1,nome);
	smtp.setString(2,login);
	smtp.setString(3,senha);
	smtp.setInt(4,id);
	
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close();
	}


if(request.getParameter("ac").equals("rm")){
	
	int id = Integer.parseInt(request.getParameter("id"));
		
	//inserção no banco
	String url = "jdbc:mysql://localhost:3306/crudjsp";
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection(url,"root","");
	Statement stmt = conn.createStatement();
	String sql = "DELETE FROM 'usuarios' WHERE id= ?";
	
	PreparedStatement smtp = conn.prepareStatement(sql);
	smtp.setInt(1,id);
		
	stmt.execute(sql);
	stmt.close();
	conn.close();
}

%>