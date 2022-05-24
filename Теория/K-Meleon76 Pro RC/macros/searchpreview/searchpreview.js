var v_3d = false; // Use 3d Preview (Alpha test) - Possible values : true, false
var v_size = '120x90'; // Preview size - Possible values : '80x60', '100x75', '120x90', '160x120', '180x135', '240x180', '320x240', '560x420', '640x480'
var lis, e, link, domain, host, conteneur, h3, div, b;

host = window.location.href;

if(/(.google.)/.test(host))
{
	if( /[\?&]fp=/.test(location.href)) {
		location.replace(location.href.replace(/[\?&]fp=[^&]*|$]/, ''));
	}

	lis = document.getElementById('res').getElementsByTagName('li');

	for(e=0;e<lis.length;e++)
	{
		if(lis[e].className == 'g' || lis[e].className == 'g w0')
		{
			if(lis[e].childNodes[1].firstChild && lis[e].childNodes[1].firstChild.className == 'ts' || lis[e].childNodes[1] && lis[e].childNodes[1].className == 'ts' || lis[e].childNodes[2] && lis[e].childNodes[2].className == 'ts')
				continue;

			h3 = lis[e].firstChild;
			if(h3.nodeName != 'H3')
				continue;

			link = h3.firstChild.href.replace('http://', '').replace('https://', '');
			domain = link.split('/');

			if(domain == '')
				continue;

			/* Hack */
			if(lis[e].childNodes[2].firstChild && lis[e].childNodes[2].firstChild.className == 'f') {
				lis[e].childNodes[2].firstChild.style.display = 'none';
			} else if(lis[e].childNodes[3].firstChild && lis[e].childNodes[3].firstChild.className == 'f') {
				lis[e].childNodes[3].firstChild.style.display = 'none';
			}

			createImg(lis[e], h3, domain[0]);
			createClearer(lis[e]);
		}
	}
}
else if(/(search.yahoo.)/.test(host))
{
	conteneur = document.getElementById('web');

	lis = conteneur.getElementsByTagName('li');

	for(e=0;e<lis.length;e++)
	{
		if(lis[e].getElementsByTagName('div').length < 1)
			continue;

		div = lis[e].firstChild;
		if(div.nodeName != 'DIV')
			continue;

		if(div.className != 'res sc sc-news')
		{
			link = div.getElementsByTagName('span');
			if(link.length > 0) {
				b = link[0].getElementsByTagName('b');
				domain = b[0].firstChild.data;

				if(domain == '')
					continue;

				createImg(lis[e], div, domain);
				createClearer(lis[e]);

				/* Hack */
				if(div.childNodes[1] && div.childNodes[1].nodeName == 'DIV' && div.childNodes[1].className == 'sm-bd') {
					div.childNodes[1].firstChild.style.styleFloat = 'none'; // IE
					div.childNodes[1].firstChild.style.cssFloat = 'none'; // Other
				}
			}
		}
	}
}
else if(/(www.bing.com\/search)/.test(host))
{
	conteneur = document.getElementById('results');

	lis = conteneur.getElementsByTagName('li');

	for(e=0;e<lis.length;e++)
	{
		if(lis[e].getElementsByTagName('div').length < 1)
			continue;

		div = lis[e].firstChild;
		if(div.nodeName != 'DIV')
			continue;

		if(div.className == 'sb_tlst')
		{
			link = div.firstChild.firstChild.href.replace('http://', '').replace('https://', '');
			domain = link.split('/');

			if(domain == '')
				continue;

			createImg(lis[e], div, domain[0]);
			createClearer(lis[e]);

			/* Hack */
			div.style.display = 'block';
			div.firstChild.firstChild.style.display = 'inline';
		}
	}
}

/* Create Preview Element */
function createImg(inElm, beforeElm, dmnUrl) {
	var newImg = document.createElement('img');
	newImg.style.margin = '3px 8px';
	newImg.style.border = 'none';
	inElm.insertBefore(newImg, beforeElm);
	newImg.style.styleFloat = 'left'; // IE
	newImg.style.cssFloat = 'left'; // Other
	newImg.src = 'http://www.easy-thumb.net/min.html?url='+dmnUrl+'&size='+v_size+((v_3d) ? '&3d' : '');
}
/* Create Clear Div */
function createClearer(inElm) {
	var newDiv = document.createElement('div');
	newDiv.style.clear = 'left';
	inElm.appendChild(newDiv);
}