<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;

class Index extends Controller
{
    public function index()
    {
//        return $this->contact();
        return $this->problem();
    }

    public function problem(){
        $data = Db::table('problem')->order('id', 'desc')->select();
        $this->assign('data',$data);
        return $this->fetch('problem');
    }

    public function contact(){
        $data =  Db::table('website')->find();
        $this->assign('data',$data);
        return $this->fetch('contact');
    }

    public function dealmsg(Request $request){
        $data['name'] = $request->param('name');
        $data['email'] = $request->param('email');
        $data['them'] = $request->param('subject');
        $data['msg'] = $request->param('message');
        $res = Db::table('msg')->insert($data);
        if($res){
            echo '<script>alert("提交成功");history.go(-1)</script>';
        }else{
            echo '<script>alert("提交失败,需重新提交");history.go(-1)</script>';
        }
    }
}
