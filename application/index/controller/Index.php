<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;
use think\facade\Cookie;
class Index extends Controller
{
    public function index()
    {
        if (Cookie::has('name')){
            $name = Cookie::get('name');
            $sid = Cookie::get('sid');
        }else{
            $name ='';
            $sid = '';
        }
        if (Cookie::has('volunteer')){
            $volunteer = Cookie::get('volunteer');
            $vid = Cookie::get('vid');
        }else{
            $volunteer ='';
            $vid = '';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);
        $this->assign('sid',Cookie::get('sid'));
        $this->assign('vid',$vid);
        $this->assign('sid',$sid);

        return $this->fetch('index');
    }

    public function login(){
        return $this->fetch('login');
    }

    public function problem(){
        if (Cookie::has('name')){
            $name = Cookie::get('name');
            $sid = Cookie::get('sid');
        }else{
            $name ='';
            $sid = '';
        }
        if (Cookie::has('volunteer')){
            $volunteer = Cookie::get('volunteer');
            $vid = Cookie::get('vid');
        }else{
            $volunteer ='';
            $vid = '';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);
        $this->assign('sid',Cookie::get('sid'));
        $this->assign('vid',$vid);
        $this->assign('sid',$sid);

        $data = Db::table('problem')->order('id', 'desc')->select();
        $this->assign('data',$data);
        return $this->fetch('problem');
    }

    public function contact(){
        if (Cookie::has('name')){
            $name = Cookie::get('name');
            $sid = Cookie::get('sid');
        }else{
            $name ='';
            $sid = '';
        }
        if (Cookie::has('volunteer')){
            $volunteer = Cookie::get('volunteer');
            $vid = Cookie::get('vid');
        }else{
            $volunteer ='';
            $vid = '';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);
        $this->assign('sid',Cookie::get('sid'));
        $this->assign('vid',$vid);
        $this->assign('sid',$sid);

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
            echo '<script>alert("提交失败");history.go(-1)</script>';
        }
    }
}
