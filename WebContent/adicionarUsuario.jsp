<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Novo Usuario</title>
</head>
<body>

<form action="usuarioAction.jsp">
	<table>
		<tr>
			<td>Nome</td>
			<td>Login</td>
			<td>Senha</td>
		</tr>
		<tr>
			<td><input type="text" name="nome"/></td>
			<td><input type="text" name="login"/></td>
			<td><input type="text" name="senha"/></td>
			<input type="hidden" name="ac" value="adicionar">					
		</tr>
	
	</table>
	
	<input type="submit" value="Adicionar">
	<a href="index.jsp"> Cancelar</a>
</form>

</body>
</html>