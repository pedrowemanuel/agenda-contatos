<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<%
@SuppressWarnings("unchecked")
ArrayList<JavaBeans> lista = (ArrayList<JavaBeans>) request.getAttribute("contatos");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Agenda de Contatos</title>
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
</head>
<body>
	<header class="cabecalho">
		<h1>Agenda de Contatos</h1>
		<a href="novo_contato.html" class="botao btn-primario">Novo
			contato</a>
		<hr>
	</header>
	<table id="tabela_contatos">
		<thead>
			<tr>
				<th align="right">Código</th>
				<th>Nome</th>
				<th>Fone</th>
				<th>Email</th>
				<th>Opções</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < lista.size(); i++) {
			%>
			<tr>
				<td align="right"><%=lista.get(i).getIdcon()%></td>
				<td><%=lista.get(i).getNome()%></td>
				<td><%=lista.get(i).getFone()%></td>
				<td><%=lista.get(i).getEmail()%></td>
				<td align="center"><a
					href="select?idcon=<%=lista.get(i).getIdcon()%>"
					class="botao btn-primario">Editar</a> <a
					href="javascript: confirmar(<%=lista.get(i).getIdcon()%>)"
					class="botao btn-vermelho">Excluir</a></td>
			</tr>
			<%}%>
		</tbody>
	</table>

	<script src="scripts/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8"
		src="scripts/jquery.dataTables.js"></script>
	<script src="scripts/confirmador.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#tabela_contatos').DataTable({
				"aaSorting" : [ [ 1, "asc" ] ]
			});
		});
	</script>
</body>
</html>