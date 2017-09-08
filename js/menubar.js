https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=5
(function()
{
	//automatically called as soon as the javascript is loaded
	window.addEventListener("load", main);
}());

function main(){
	var response = httpGet("https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=5");
	//console.log(response); //ok aqui
	for(var i = 0;i< response.length;i++){
		display_menu_item(null,response[i]);
	}


/*
	response.forEach(
		([key, value]) => display_menu_item(key, value)
	);
*/
}


/*
	response
	show symbol
	market coinmarketcap
	volume

	name (symbol)
	percentage_change_1h

	name	"Bitcoin"
	symbol	"BTC"


	percent_change_1h	"-1.1"
	percent_change_24h	"-7.29"
	percent_change_7d	"-10.68" 

	price_eur	"3559.0969365"
	24h_volume_eur	"1672265874.6"
	market_cap_eur	"58911685109.0"
*/


function httpGet(url){
	var response = new XMLHttpRequest();

	response.open("GET",url,false); //se nao der por isto a abrir uma pagina de erro qq
	response.send(null);
	//console.log(response);
	return JSON.parse(response.responseText);
}

function display_menu_item(key, value){
	console.log(key);
	console.log(value);
	var menu_item = document.createElement("div");
	menu_item.className = "card";
	menu_item.id = value["id"];

	/****************IMAGEM E NOMES***********/
	var header = document.createElement("div");
	header.className="header";
	var imgspan = document.createElement("span");

	var currencyImg = document.createElement("img");
	currencyImg.src = "https://bitcoin.org/img/icons/opengraph.png";
	currencyImg.width = 50;
	currencyImg.height = 50;
	imgspan.appendChild(currencyImg);


	var titlespan = document.createElement("span");
	var currencyName = document.createElement("p");
	currencyName.innerHTML = value["name"];
	titlespan.appendChild(currencyName);

	header.appendChild(imgspan);
	header.appendChild(titlespan);
	
	menu_item.appendChild(menu_item);

	var table = document.getElementById("column1");
	table.appendChild(header);
}

/*
############card###########
#	header				  #
#img  		nome coin     #
#_________________________#
#	  txt   | 		txt   #
#%24   br	| v24	br	  #
#	  txt 	|		txt   #
###########################
*/