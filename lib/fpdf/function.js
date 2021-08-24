// JavaScript Document
//Erick Herrera Gilvonio
	function conMayusculas(field) {  
		field.value = field.value.toUpperCase()
	}

	function ComprobarAcentos(inputtext)
	{
		if(!inputtext) return false;
		if(inputtext.value.match('[á,é,í,ó,ú]|[Á,É,Í,Ó,Ú]'))
	{
	alert('No se permiten tildes');
	inputtext.value = '';
	inputtext.focus();
	return true;
	}
	return false;
	}
	
	function conMinusculas(field) {  
		field.value = field.value.toLowerCase()
	}