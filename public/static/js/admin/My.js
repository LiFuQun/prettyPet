var AJAX= {
    ajaxPro: function (obj) {
        var id = (obj == undefined || obj.id == undefined) ? '' : obj.id;              //显示返回id
        var name = (obj == undefined || obj.name == undefined) ? '' : obj.name;     //用户名
        var url = (obj == undefined || obj.url == undefined) ? '' : obj.url;            //get_url
        var pwd = (obj == undefined || obj.pwd == undefined) ? '' : obj.pwd;        //密码
        var xmlHttp;
        if (window.XMLHttpRequest) {
            // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行的代码
            xmlhttp = new XMLHttpRequest();
        } else {
            //IE6, IE5 浏览器执行的代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        // 监听响应
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState ==4 && xmlhttp.status == 200) {
                var msg = xmlhttp.responseText;
                if(msg == 1){
                    parent.location.href='admin.php?s=index/main';
                    // window.onload('admin.php?s=index/starter');
                } else {
                    document.getElementById(''+id+'').innerHTML = msg;
                }
            }
        }
        xmlhttp.open("GET", "admin.php?s=index/checklogin/name/"+name+"/pwd/"+pwd, true);
        xmlhttp.send();
    }
}