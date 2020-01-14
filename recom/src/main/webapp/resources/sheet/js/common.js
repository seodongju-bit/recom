var ibleaders;
ibleaders = ibleaders || {};
ibleaders = {
    license: "W2FtSztPKC9wbDc7YTJxbn8KYB9tHykyZW0iI257YjNgbUMnWD0NYTI0fys8bDc/JSt0DXoaKA53fiA5Lns4NmVvOz9TOEs6XXE2K2Q1ej98K2R1LgUiFWZEPBZCGC47JTpjPjZzTitWbx40"
};

//try{top.D_$_ = null}catch(e){}; 

function detectmob() { 
 if( navigator.userAgent.match(/Android/i)
 || navigator.userAgent.match(/webOS/i)
 || navigator.userAgent.match(/iPhone/i)
 || navigator.userAgent.match(/iPad/i)
 || navigator.userAgent.match(/iPod/i)
 || navigator.userAgent.match(/BlackBerry/i)
 || navigator.userAgent.match(/Windows Phone/i)
 ){
    return true;
  }
 else {
    return false;
  }
}

document.write("<link rel='stylesheet' href='/recom/resources/common/css/style.css'/>");
if(detectmob()){
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/jquery.mobile-1.3.2.js'></script>");
}else{
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/jquery-1.7.2.min.js'></script>");
}
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/jquery.cookie.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/jquery.treeview.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/jquery.easing.1.3.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/iepngfix_tilebg.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/contact.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/debounce.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/jquery.blockUI.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='/recom/resources/common/js/etc.js'></script>");



