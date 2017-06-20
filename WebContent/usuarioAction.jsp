<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>


<%

if(request.getParameter("ac").equals("adicionar")){
	
	String nome  = request.getParameter("nome");
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	
	//inserção no banco
	String user = "azure";
	String password = "6#vWHD_$";
	String urlLocal = "jdbc:mysql://localhost:3306/crudjsp";
	String urlAzure= "jdbc:mysql://127.0.0.1:54447/localdb";
	
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection(urlAzure,user,password);
	Statement stmt = conn.createStatement();
	String sql = "INSERT INTO usuarios(id,nome,login,senha) VALUES(null,'"+nome+"','"+login+"','"+senha+"')";
	
	PreparedStatement smtp = conn.prepareStatement(sql);
		
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close();
	
	//Redirecionar página
	String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
}


if(request.getParameter("ac").equals("atualizar")){
		
	int id = Integer.parseInt(request.getParameter("id"));	
	String nome  = request.getParameter("nome");
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	
	//inserção no banco
	String user = "azure";
	String password = "6#vWHD_$";
	String urlLocal = "jdbc:mysql://localhost:3306/crudjsp";
	String urlAzure= "jdbc:mysql://127.0.0.1:54447/localdb";	
	
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection(urlAzure,user,password);
	String sql = "UPDATE usuarios SET nome='"+nome+"',login='"+login+"',senha='"+senha+"' WHERE id='"+id+"'";
	
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	//stmt.setString(1,nome);
	//stmt.setString(2,login);
	//stmt.setString(3,senha);
	//stmt.setInt(4,id);
	
	stmt.executeUpdate();
	stmt.close();
	conn.close();
	
	//Redirecionar página
	String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
	
	}


if(request.getParameter("ac").equals("rm")){
	
	int id = Integer.parseInt(request.getParameter("id"));
    
	
	//inserção no banco
	String user = "azure";
	String password = "6#vWHD_$";
	String urlLocal = "jdbc:mysql://localhost:3306/crudjsp";
	String urlAzure= "jdbc:mysql://127.0.0.1:54447/localdb";
	
	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection(urlAzure,user,password);
	String sql = "DELETE FROM usuarios WHERE id="+id;
	System.out.print(sql);
	
	PreparedStatement stmt = conn.prepareStatement(sql);
			
	stmt.execute();
	stmt.close();
	conn.close();
	
	//Redirecionar página
	String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
}

%>