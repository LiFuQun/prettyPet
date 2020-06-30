<?php
namespace app\admin\controller;
use function Sodium\compare;
use think\Controller;
use think\Request;
use think\Db;

class Blog extends Controller
{
    public function index()
    {
        return $this->blogs();
    }

    public function showblog(Request $request){
        $id = $request->param('id');
        $data = Db::table('publish')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('showblog');
    }

    public function publish(){
        return $this->fetch('publish');
    }

    public function blogs(){
        $data =Db::table('publish')->order('id', 'desc')->select();
        $this->assign('data', $data);
        return $this->fetch('blogs');
    }

    //保存发布的内容
    public function savepublish(Request $request){
        $data['title'] = $request->param('title');   //标题
        $data['keyword'] = $request->param('keyword');  //关键词
        $data['des'] = $request->param('des');  //描述
        $data['text'] = $request->param('content');   //内容
        $res = Db::table('publish')->insert($data);
        if($res){
            return 1;
        }else{
            return 2;
        }
    }

    //保存发布内容时上传的图片
    public function upload(){
        move_uploaded_file($_FILES['image_file']['tmp_name'],'./static/upload/'.$_FILES['image_file']['name']);
        exit(json_encode(array('errno'=>0,'data'=>['./static/upload/'.$_FILES['image_file']['name']])));
    }

}
