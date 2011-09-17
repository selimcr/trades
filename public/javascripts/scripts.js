// JavaScript Document





<!--

//SUMA LOS CAMPOS DEL CONCILIACION

function doadd() {



var beg = eval(document.form1.beg.value);

var wires = eval(document.form1.wires.value);

var fd = document.form1.FD.value;

if(isNaN(fd)){alert("ISNAN");}

var pl = eval(document.form1.pl.value);

var roll = document.form1.roll.value;

var fees = document.form1.nafees.value;

var comm = document.form1.commissions.value;

var jent = document.form1.Jent.value;

var Ote = document.form1.ote.value;

var LiqV = eval(document.form1.liqV.value);

var Mamount = document.form1.Mamount.value;

var Mexx = eval(document.form1.Mexx.value);

var SonD = eval(document.form1.SonD.value);





fees='-'+fees;

fees=eval(fees);



if(fd.charAt(0)=='('){

					 fd=fd.substring(1,fd.length-1);

					 fd='-'+d;

					 fd=eval(fd);

					 }else {fd=eval(fd);}

if(roll.charAt(0)=='('){

					 roll=roll.substring(1,roll.length-1);

					 roll='-'+roll;

					 roll=eval(roll);

					 }else {roll=eval(roll);}

if(comm.charAt(0)=='('){

					 comm=comm.substring(1,comm.length-1);

					 comm='-'+comm;

					 comm=eval(comm);

					 }else {comm=eval(comm);}

if(jent.charAt(0)=='('){

					 jent=jent.substring(1,jent.length-1);

					 jent='-'+jent;

					 jent=eval(jent);

					 }else {jent=eval(jent);}

if(Ote.charAt(0)=='('){

					 Ote=Ote.substring(1,Ote.length-1);

					 Ote='-'+Ote;

					 Ote=eval(Ote);

					 }else {Ote=eval(Ote);}

if(Mamount.charAt(0)=='('){

					 Mamount=Mamount.substring(1,Mamount.length-1);

					 Mamount='-'+Mamount;

					 Mamount=eval(Mamount);

					 }else {Mamount=eval(Mamount);}

var sum=0;

var sum2=0;

var sum3=0;

sum = eval(beg+ wires + fd + pl + roll + fees+comm+jent); 

sum = Math.round(sum*100)/100;

document.form1.ending.value=sum;

sum2=(sum+Ote);

sum2 = Math.round(sum2*100)/100;

document.form1.liqV.value=(sum2);

sum3 =(sum2+Mamount);

sum3 = Math.round(sum3*100)/100;

document.form1.Mexx.value=eval(sum3);

//alert(sum);

}





function verificar(){

var fd= document.form1.FD.value;

	if(isNaN(fd)){

			window.alert("Por favor ingrese solo numeros");

			document.form1.FD.value="0";

			document.form1.FD.focus();

		}

var roll= document.form1.roll.value;

	if(isNaN(roll)){

			alert("Por favor ingrese solo numeros");

			document.form1.roll.value="0";

			document.form1.roll.focus();

		}

var fees= document.form1.nafees.value;

	if(isNaN(fees)){

			alert("Por favor ingrese solo numeros");

			document.form1.nafees.value="0";

			document.form1.nafees.focus();

		}

var comm= document.form1.commissions.value;

	if(isNaN(comm)){

			alert("Por favor ingrese solo numeros");

			document.form1.commissions.value="0";

			document.form1.commissions.focus();

		}

var jent= document.form1.Jent.value;

	if(isNaN(jent)){

			alert("Por favor ingrese solo numeros");

			document.form1.Jent.value="0";

			document.form1.Jent.focus();

		}

var Ote= document.form1.ote.value;

	if(isNaN(Ote)){

			alert("Por favor ingrese solo numeros");

			document.form1.ote.value="0";

			document.form1.ote.focus();

		}

var Mam= document.form1.Mamount.value;

	if(isNaN(Mam)){

			alert("Por favor ingrese solo numeros");

			document.form1.Mamount.value="0";

			document.form1.Mamount.focus();

		}

var SonD= document.form1.SonD.value;

	if(isNaN(SonD)){

			alert("Por favor ingrese solo numeros");

			document.form1.SonD.value="0";

			document.form1.SonD.focus();

		}

	}



function verificarMaster(){

var fillSell= document.formTrade.fillSell.value;

	if(isNaN(fillSell)){

			alert("Por favor ingrese solo numeros");

			document.formTrade.fillSell.value="0";

			document.formTrade.fillSell.focus();

		}

var fillBuy= document.formTrade.fillBuy.value;

	if(isNaN(fillBuy)){

			alert("Por favor ingrese solo numeros");

			document.formTrade.fillBuy.value="0";

			document.formTrade.fillBuy.focus();

		}

var percentage= document.formTrade.percentage.value;

	if(isNaN(percentage)){

			alert("Por favor ingrese solo numeros");

			document.formTrade.percentage.value="0";

			document.formTrade.percentage.focus();

		}

}



function verificarClient(){

var capitalInitial= document.formCrear.capitalInitial.value;

	if(isNaN(capitalInitial)){

			alert("Por favor ingrese solo numeros");

			document.formCrear.capitalInitial.value="0";

			document.formCrear.capitalInitial.focus();

		}

var percentage= document.formCrear.percentage.value;

	if(isNaN(percentage)){

			alert("Por favor ingrese solo numeros");

			document.formCrear.percentage.value="0";

			document.formCrear.percentage.focus();

		}

var comission= document.formCrear.comission.value;

	if(isNaN(comission)){

			alert("Por favor ingrese solo numeros");

			document.formCrear.comission.value="0";

			document.formCrear.comission.focus();

		}

var capitalActual= document.formCrear.capitalActual.value;

	if(isNaN(capitalActual)){

			alert("Por favor ingrese solo numeros");

			document.formCrear.capitalActual.value="0";

			document.formCrear.capitalActual.focus();

		}

var amount= document.formCrear.amount.value;

	if(isNaN(amount)){

			alert("Por favor ingrese solo numeros");

			document.formCrear.amount.value="0";

			document.formCrear.amount.focus();

		}

var account= document.formCrear.account.value;

	if(isNaN(account)){

			alert("Por favor ingrese solo numeros");

			document.formCrear.account.value="0";

			document.formCrear.account.focus();

		}

}