<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agenda de contatos</title>
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h1>Editar Contato</h1>
	<form action="update" name="frmContato" class="form">
		<table class="tabela">
			<tr>
				<td><label for="idcon">Código</label> <input type="text"
					name="idcon" id="idcon" class="caixa caixa-codigo" readonly
					value="<%=request.getAttribute("idcon")%>"></td>
			</tr>
			<tr>
				<td><label for="nome">Nome</label> <input type="text"
					name="nome" id="nome" placeholder="Nome*: " class="caixa"
					value="<%=request.getAttribute("nome")%>"></td>
			</tr>
			<tr>
				<td><label for="fone">Fone</label> <input type="text"
					name="fone" id="fone" placeholder="Fone*: "
					class="caixa caixa-fone"
					value="<%=request.getAttribute("fone")%>"></td>
			</tr>
			<tr>
				<td><label for="email">Email</label> <input type="email"
					name="email" id="email" placeholder="Email: " class="caixa"
					value="<%=request.getAttribute("email")%>"></td>
			</tr>
		</table>
		<input type="button" name="adiconar" value="Salvar"
			class="botao btn-primario" onclick="validar()"> <a
			href="main" class="botao btn-secundario">Voltar</a>
	</form>

	<script src="scripts/validador.js"></script>
</body>
</html>