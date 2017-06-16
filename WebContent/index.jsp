<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"   %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CrudJSP</title>
</head>
<body>
	<h1> Crud JSP </h1>
	<h3> Usuarios </h3>
	
	<table border="1">
	
		<tr>
			<td>Id</td>
			<td>Nome</td>
			<td>Login</td>
			<td>Senha</td>
			<td>Opção</td>
		</tr>
	<%
	
	int id=0;
	String nome="";
	String login="";
	String senha="";
	String action="";
	
		String url = "jdbc:mysql://localhost:3306/crudjsp";
		Class.forName("com.mysql.jdbc.Driver"); 
		
		Connection conn = DriverManager.getConnection(url,"root","");
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
		while(rs.next()){
			id    = rs.getInt("id");
			nome  = rs.getString("nome");
			login = rs.getString("login");
			senha = rs.getString("senha");
		
	%>	
	
	
	<tr>
		<td><%=id %></td>
		<td><%=nome %></td>
		<td><%=login %></td>
		<td><%=senha %></td>
		
		<td>
			<a href="editarUsuario.jsp?id=<%=id%>&nome=<%=nome%>&login=<%=login%>&senha<%=senha%>">Editar</a>
			<a href="usuarioAction.jsp?id=<%=id%>&ac=rm">Remover</a>
		</td>
		
	</tr>
	<%
		}//fechar o loop
	
		rs.close();
		stmt.close();
		conn.close();
	%>
	</table>
	
	<a href="adicionarUsuario.jsp">Novo</a>
	
</body>
</html>