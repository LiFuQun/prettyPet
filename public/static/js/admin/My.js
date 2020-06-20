var AJAX= {
    ajaxPro: function (obj) {
        var id = (obj == undefined || obj.id == undefined) ? '' : obj.id;              //显示返回id
        var name = (obj == undefined || obj.name == undefined) ? '' : obj.name;     //用户名
        var url = (obj == undefined || obj.url == undefined) ? '' : obj.url;            //get_url
        var pwd = (obj == undefined || obj.pwd == undefined) ? '' : obj.pwd;        //密码
        // var ErrorTextID = (obj == undefined || obj.ErrorTextID == undefined) ? '' : obj.ErrorTextID;    //完善资料提醒
        // var Query = (obj == undefined || obj.Query == undefined) ? '' : obj.Query;              //查询语句
        // var queryFlag = (obj == undefined || obj. queryFlag == undefined) ? '' : obj. queryFlag;
        // var Data = (obj == undefined || obj. Data == undefined) ? '' : obj. Data;                //用户忘记密码身份检测

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
                    parent.location.href='admin.php?s=index/starter';
                    // window.onload('admin.php?s=index/starter');
                } else {
                    document.getElementById(''+id+'').innerHTML = msg;
                }
            }
        }
        xmlhttp.open("GET", "admin.php?s=index/checklogin/name/"+name+"/pwd/"+pwd, true);
        // if(Query != ''){
        //     xmlhttp.open("GET", url + "?Query=" + Query+"&queryFlag="+ queryFlag+"&tb_name="+ id, true);
        // }
        // if(thumb != '') {   //如果没传入用户错误信息提示ID 则实现显示点评喜欢或不喜欢总数
        //     xmlhttp.open("GET", url + "?dongtaiID=" + dongtaiID + "&thumb=" + thumb, true);
        // }
        // if(ErrorTextID != ''){
        //     xmlhttp.open("GET", url + "?ErrorTextID=" + ErrorTextID, true);
        // }
        // if(Data != ''){
        //     xmlhttp.open("GET", url + "?Data=" + Data, true);
        // }
        xmlhttp.send();
    }
}