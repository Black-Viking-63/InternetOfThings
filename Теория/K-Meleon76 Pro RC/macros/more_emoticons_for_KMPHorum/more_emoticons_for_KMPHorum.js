function jh_insertemoticon(a){
	
	var ta = document.getElementById('phorum_textarea');
	var esrc = a.src;
	var srcl = esrc.length;
	var selp = ta.selectionStart;
	var sele = selp+srcl+11;
	var fp = ta.value.substr(0,selp)
	var ep = ta.value.substr(selp);
	var reval = fp+'[img]'+esrc+'[/img]'+ep;
	
	ta.value = reval;
	
	ta.focus();
	ta.setSelectionRange(sele,sele);
}


function kmemot_loadimg(ls){

var ar1 = ['http://s19.postimg.org/cz4d1mw5r/smile.gif', 'http://s19.postimg.org/tnrk8y7nz/happy.gif', 'http://s19.postimg.org/p14c9iurz/wink.gif', 'http://s19.postimg.org/c8bmvutsf/sleep.gif', 'http://s19.postimg.org/h6kwlsci7/facepalm.gif', 'http://s19.postimg.org/roayhjdcf/dry.gif', 'http://s19.postimg.org/pg5yrokzz/rolleyes.gif', 'http://s19.postimg.org/5nq0n65an/drool.gif', 'http://s19.postimg.org/dac63jgwf/laugh.gif', 'http://s19.postimg.org/5707mzs5r/biggrin.gif', 'http://s19.postimg.org/3qxvwc40f/haha.gif', 'http://s19.postimg.org/fk4vs1f7z/rofl.gif', 'http://s19.postimg.org/jqus4hl5b/tomaa.gif', 'http://s19.postimg.org/kg8ijqfdb/risa_ani3.gif', 'http://s19.postimg.org/6i7yvgnrj/172.gif', 'http://s19.postimg.org/qqdfhlahb/whistling.gif', 'http://s19.postimg.org/y5tv11npr/eusathink1.gif', 'http://s19.postimg.org/gnp03zzv3/rtfm.gif', 'http://s19.postimg.org/ndiigq43z/166.gif', 'http://s19.postimg.org/q4a7wvubz/mad.gif', 'http://s19.postimg.org/cefoo377z/nono.gif', 'http://s19.postimg.org/sae628thr/tongue.gif', 'http://s19.postimg.org/lrboegllb/lengua.gif', 'http://s19.postimg.org/3x2e7xydr/beee.gif', 'http://s19.postimg.org/bosaxzhan/hmmm.gif', 'http://s19.postimg.org/fch8vj49b/ohmy.gif', 'http://s19.postimg.org/75knq7osv/huh.gif', 'http://s19.postimg.org/u65jr57pr/unsure.gif', 'http://s19.postimg.org/t9lmvly6n/dntknw.gif', 'http://s19.postimg.org/83n8n9xzj/blink.gif', 'http://s19.postimg.org/dkxxbhglr/wacko.gif', 'http://s19.postimg.org/cu0lryoun/shok.gif', 'http://s19.postimg.org/sppfv9ff3/sad.gif', 'http://s19.postimg.org/nef4oaiq7/triste_ani3.gif', 'http://s19.postimg.org/ug8gwqwy7/triste_ani4.gif', 'http://s19.postimg.org/nwwshhaa7/crying.gif', 'http://s19.postimg.org/i66m3r2a7/cray.gif', 'http://s19.postimg.org/52jvtekpb/secret.gif', 'http://s19.postimg.org/5f1moq79r/lagrimones.gif', 'http://s19.postimg.org/l6wnbrscv/miedo.gif', 'http://s19.postimg.org/zemc0f51r/muro.gif', 'http://s19.postimg.org/oo3ashgsv/rant.gif', 'http://s19.postimg.org/q94sf2mvj/cawento.gif', 'http://s19.postimg.org/45zyxvb67/blackeye.gif', 'http://s19.postimg.org/nlaqqz4gf/beso.gif', 'http://s19.postimg.org/ivtztus7j/enamorado.gif', 'http://s19.postimg.org/mps1gqyxb/inlove.gif', 'http://s19.postimg.org/ppd6sgthr/wub.gif', 'http://s19.postimg.org/6m6dpgimn/dirol.gif', 'http://s19.postimg.org/svy318i8f/ph34r.gif', 'http://s19.postimg.org/ktw2e3vbj/dormido.gif', 'http://s19.postimg.org/9za0yfmtr/186.gif', 'http://s19.postimg.org/bscxmr80f/angel2.gif', 'http://s19.postimg.org/dt3h7l45r/boxing.gif', 'http://s19.postimg.org/5h7q6c6rz/band.gif', 'http://s19.postimg.org/i4woac0gf/censored2.gif', 'http://s19.postimg.org/suad2lc9b/crazy.gif', 'http://s19.postimg.org/ph24fviof/drunk.gif', 'http://s19.postimg.org/xdr71ujin/eek3.gif', 'http://s19.postimg.org/ljjg47l8v/happy_b.gif', 'http://s19.postimg.org/baqyydx73/help.gif', 'http://s19.postimg.org/hxi85b49b/loco.gif', 'http://s19.postimg.org/xe0dtbya7/nospam.gif', 'http://s19.postimg.org/6ewiy6btb/offtopic.gif', 'http://s19.postimg.org/twybqcz7z/oops.gif', 'http://s19.postimg.org/4ah7u7gi7/santabgrin.gif', 'http://s19.postimg.org/y683pn8sv/shit.gif', 'http://s19.postimg.org/r0ky0xp3j/user.gif'];
	
	var cs1 = 0;
	var kmemot_sml;
	switch(ls){
		case 'load':

			cs1 = 0;

			while(cs1<ar1.length){
				if(!document.getElementById('sml'+cs1)){
					kmemot_sml = document.createElement('img');
					kmemot_sml.setAttribute('id','sml'+cs1);
					kmemot_sml.setAttribute('src',ar1[cs1]);
					kmemot_sml.setAttribute('onclick','jh_insertemoticon(this);');
					
					document.getElementById('kmemotdiv').appendChild(kmemot_sml);
				}
				else{
					document.getElementById('sml'+cs1).src = ar1[cs1];
				}
				cs1++;
			}
			break;
		default:
		
			cs1 = 0;

			while(cs1<ar1.length){
				document.getElementById('sml'+cs1).src = '';
				cs1++;
			}

		break;
	}
}

function kmemot_toggle(){

var kmemot_dst = document.getElementById('kmemotdiv').style;

	switch(kmemot_dst.display){
		case 'none':
			kmemot_dst.display = 'inline-block';
			break;

		case 'inline-block':
			kmemot_dst.display = 'none';
			break;

		default:
			break;
	}

}

var jseditortoolscheck = document.getElementById('editor-tools');

if(jseditortoolscheck){

	if(!document.getElementById('kmemotdiv')){

	var kmemot_stl = document.createElement('style');
	kmemot_stl.setAttribute('type','text/css');
	document.getElementsByTagName('head')[0].appendChild(kmemot_stl);
	
	kmemot_stl.innerHTML = '#kmemotdiv{background-color: #C0C0C0; position:relative; top: 0px; right: 0px; width: 97%; height: 200px; overflow-y: scroll; padding: 10px;} #kmemotdiv img{	border-width: 2px;	border-style: dotted;border-color: #aaaaaa #555555 #555555 #aaaaaa;	margin: 3px;	padding: 3px;	cursor: pointer;}';
	


	var kmemotimg = document.createElement('img');
		kmemotimg.setAttribute('id', 'kmemotjh');
		kmemotimg.setAttribute('src', 'http://s19.postimg.org/tnrk8y7nz/happy.gif');
		kmemotimg.setAttribute('style', 'margin-bottom: 4px!important; cursor: pointer;');
				
		kmemotimg.setAttribute('onclick', 'kmemot_toggle(); kmemot_loadimg(\'load\');');

		
	jseditortoolscheck.appendChild(kmemotimg);
	
	var kmemotdiv = document.createElement('div');
		kmemotdiv.setAttribute('id', 'kmemotdiv');
		kmemotdiv.setAttribute('style', 'display: none;');
		kmemotdiv.setAttribute('title', 'Select an emoticon or click empty space to close');
		kmemotdiv.setAttribute('onclick', 'this.style.display = \'none\'; kmemot_loadimg(0);');
	
	jseditortoolscheck.appendChild(kmemotdiv);
		
	}		
		
}


