<?php

namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;

class Baike extends Controller
{
    public function baikes(){

        $data = Db::table('baike')->order('id','desc')->select();
        $this->assign('data',$data);
        return $this->fetch('baikes');
    }

    public function showbaike(Request $request){
        $id = $request->param('id');
        $data = Db::table('baike')->where('id',$id)->find();
//        echo dump($data);
//        exit();
        $this->assign('data',$data);
        return $this->fetch('showbaike');
    }

    public function addbaike(){

        $data = Db::table('classb')->select();
        $this->assign('data',$data);
        return $this->fetch('addbaike');
    }

    public function dealclassb(Request $request){
        $data['classb'] = $request->param('classb');
        if($data['classb'] == ''){
            $db = Db::table('classb')->insert($data);
            if ($db){
                echo "<script>alert('添加成功');history.go(-1)</script>";
            }else{
                echo "<script>alert('添加失败');history.go(-1)</script>";
            }
        }else{
            echo "<script>alert('填写不能为空');history.go(-1)</script>";
            return;
        }
    }

    public function dealbaike(Request $request){
        $data['name'] = $request->param('name');
        $data['classb'] = $request->param('classb');
        $data['des'] = $request->param('des');
        $data['content'] = $request->param('content');
        try{
            $db = Db::table('baike')->insert($data);
            return 1;
        }catch(\Exception $e){
            return json($e->getMessage());
        }
    }
    //保存百科上传的图片
    public function upload(){
        move_uploaded_file($_FILES['image_file']['tmp_name'],'./static/img/index/baike/'.$_FILES['image_file']['name']);
        exit(json_encode(array('errno'=>0,'data'=>['./static/img/index/baike/'.$_FILES['image_file']['name']])));
    }
}