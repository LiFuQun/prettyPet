<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch('index');
    }

    public function zixun(){
        return $this->problem();
    }
    public function problem(){
        $data = Db::table('problem')->order('id', 'desc')->select();
        $this->assign('data',$data);
        return $this->fetch('problem');
    }

    public function baike(){
       
        $data1 = Db::table('baike')->where('classb','猫')->select();
        $data2 = Db::table('baike')->where('classb','狗')->select();
        $data3 = Db::table('baike')->where('classb','其他')->select();
      
        $this->assign('data1',$data1);
        $this->assign('data2',$data2);
        $this->assign('data3',$data3);
        return $this->fetch('baike/baike');
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
