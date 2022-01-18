/**
 * 
 * Validação de formulário
 */
 
 function validar() {
	const nome = frmContato.nome.value;
	const fone = frmContato.fone.value;
	
	if (nome === '') {
		alert("Preencha o campo Nome!");
		frmContato.nome.focus();
		return false;
	}
	
	if (fone === '') {
		alert("Preencha o campo Fone!");
		frmContato.fone.focus();
		return false;
	}
	
	document.forms["frmContato"].submit();
}