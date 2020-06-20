var UI = {
    // 加载模态框
    alert: function (obj) {
        var title = (obj == undefined || obj.title == undefined) ? '系统消息' : obj.title;
        var msg = (obj == undefined || obj.msg == undefined) ? '' : obj.msg;
        var icon = (obj == undefined || obj.icon == undefined) ? 'warm' : obj.icon;
        var html = '<div class="modal fade" tabindex="-1" role="dialog" id="UI_alert_sm">\
					  <div class="modal-dialog modal-sm" role="document">\
					    <div class="modal-content">\
					      <div class="modal-header">\
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
					        <h4 class="modal-title">' + title + '</h4>\
					      </div>\
					      <div class="modal-body">\
					        <p><img src="../image/' + icon + '.png" style="width:32px;height:32px;margin-right:5px;" />' + msg + '</p>\
					      </div>\
					      <div class="modal-footer">\
					        <button type="button" class="btn btn-primary"  onclick="$(\'#UI_alert_sm\').modal(\'hide\');">确定</button>\
					      </div>\
					    </div>\
					  </div>\
					</div>';

        $('body').append(html);
        $('#UI_alert_sm').modal({backdrop: 'static'});
        $('#UI_alert_sm').modal('show');
        $('#UI_alert_sm').on('hidden.bs.modal', function (e) {
            $('#UI_alert_sm').remove();
        });
    },
    //加载页面
    open: function (obj) {
        var title = (obj == undefined || obj.title == undefined) ? '' : obj.title;
        var url = (obj == undefined || obj.url == undefined) ? '' : obj.url;
        var width = (obj == undefined || obj.width == undefined) ? 550 : obj.width;
        var height = (obj == undefined || obj.height == undefined) ? 450 : obj.height;

        var html = '<div class="modal fade" tabindex="-1" role="dialog" id="UI_open_lg">\
					  <div class="modal-dialog modal-lg" role="document">\
					    <div class="modal-content">\
					      <div class="modal-header">\
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
					        <h4 class="modal-title">' + title + '</h4>\
					      </div>\
					      <div class="modal-body">\
					 <iframe src="' + url + '" style="width:100%;height:100%" frameborder="0">\
					      </div>\
					    </div>\
					  </div>\
					</div>';
        $('body').append(html);
        $('#UI_open_lg .modal-lg').css('width', width);
        $('#UI_open_lg .modal-body').css('height', height);
        $('#UI_open_lg').modal({backdrop: 'static'});
        $('#UI_open_lg').modal('show');

        $('#UI_open_lg').on('hidden.bs.modal', function (e) {
            $('#UI_open_lg').remove();
        });
    },
    input: function (obj) {
        var url = (obj == undefined || obj.url == undefined) ? '' : obj.url;
        var fromUrl = (obj == undefined || obj.fromUrl == undefined) ? '' : obj.fromUrl;
        var title = (obj == undefined || obj.title == undefined) ? '' : obj.title;
        var dongtaiID = (obj == undefined || obj.dongtaiID == undefined) ? '' : obj.dongtaiID;
        var fabuUserID = (obj == undefined || obj.fabuUserID == undefined) ? '' : obj.fabuUserID;
        var html = '<div class="modal fade" id="commModal" tabindex="-1" role="dialog">\
            <div class="modal-dialog" role="document">\
            <div class="modal-content">\
            <div class="modal-header">\
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
            <h4 class="modal-title" id="exampleModalLabel">'+title+'</h4>\
            </div>\
            <div class="modal-body">\
            <form method="post" action="'+url+'">\
            <div class="form-group">\
            <label for="message-text" class="control-label">Content:</label>\
            <input type="text" name="content" class="form-control" id="content-text">\
            </div>\
            <div class="modal-footer">\
            <input type="hidden" name="dongtaiID" value="' + dongtaiID + '">\
            <input type="hidden" name="fabuUserID" value="' + fabuUserID + '">\
            <input type="hidden" name="fromUrl" value="' + fromUrl + '">\
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>\
            <input type="submit" name="submit" value="确定"  class="btn btn-primary">\
            </div></form></div></div></div></div>';

        $('body').append(html);
        $('#commModal').modal({backdrop: 'static'});
        $('#commModal').modal('show');
        $('#commModal').on('hidden.bs.modal', function (e) {
            $('#commModal').remove();
        });
    },
    confirm: function (obj) {
        var msg = (obj == undefined || obj.msg == undefined) ? '' : obj.msg;
        var NO = (obj == undefined || obj.NO == undefined) ? '' : obj.NO;
        var YES = (obj == undefined || obj.YES == undefined) ? '' : obj.YES;
        var html = '<div class="modal fade" tabindex="-1" id="confirm" role="dialog">\
            <div class="modal-dialog modal-sm" role="document">\
            <div class="modal-content">\
            <div class="modal-header">\
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
        <h4 class="modal-title">系统提示</h4>\
        </div>\
        <div class="modal-body">\
            <p>'+msg+'</p>\
        </div>\
        <div class="modal-footer">\
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="return Confirm()">'+NO+'</button>\
            <button type="submit" class="btn btn-primary" onclick="return Confirm()">'+YES+'</button>\
        </form></div></div><!-- /.modal-content -->\
        </div><!-- /.modal-dialog -->\
        </div><!-- /.modal -->';

        $('body').append(html);
        $('#confirm').modal({backdrop: 'static', keyboard: false});
        // $('#confirm').modal('show');
        // $('#confirm').on('hidden.bs.modal', function (e) {
        //     $('#confirm').remove();
        //  });
    }
}
//userdata thumbs fabufongtai
var AJAX= {
    ajaxPro: function (obj) {
        var id = (obj == undefined || obj.id == undefined) ? '' : obj.id;              //显示返回id
        var thumb = (obj == undefined || obj.thumb == undefined) ? '' : obj.thumb;     //喜欢或不喜欢flag
        var url = (obj == undefined || obj.url == undefined) ? '' : obj.url;            //get_url
        var dongtaiID = (obj == undefined || obj.dongtaiID == undefined) ? '' : obj.dongtaiID;        //喜欢或不喜欢评论动态ID
        var ErrorTextID = (obj == undefined || obj.ErrorTextID == undefined) ? '' : obj.ErrorTextID;    //完善资料提醒
        var Query = (obj == undefined || obj.Query == undefined) ? '' : obj.Query;              //查询语句
        var queryFlag = (obj == undefined || obj. queryFlag == undefined) ? '' : obj. queryFlag;
        var Data = (obj == undefined || obj. Data == undefined) ? '' : obj. Data;                //用户忘记密码身份检测
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
                document.getElementById(''+id+'').innerHTML = xmlhttp.responseText;
            }
        }
           if(Query != ''){
                xmlhttp.open("GET", url + "?Query=" + Query+"&queryFlag="+ queryFlag+"&tb_name="+ id, true);
            }
            if(thumb != '') {   //如果没传入用户错误信息提示ID 则实现显示点评喜欢或不喜欢总数
                xmlhttp.open("GET", url + "?dongtaiID=" + dongtaiID + "&thumb=" + thumb, true);
            }
            if(ErrorTextID != ''){
                xmlhttp.open("GET", url + "?ErrorTextID=" + ErrorTextID, true);
            }
            if(Data != ''){
                xmlhttp.open("GET", url + "?Data=" + Data, true);
            }
        xmlhttp.send();
    }
}
function Confirm(){
    if(!confirm('确定删除该内容吗？')){
        return 1;
    }
}
