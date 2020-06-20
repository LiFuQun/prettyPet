<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;

class Index extends Controller
{
    public function index()
    {
       return $this->login();

    }
    public function starter(){
        return $this->fetch('starter');
    }
    public function login(){
        return $this->fetch('login');
    }

    public function checklogin(Request $request){
//        echo 'asd';
        $name = $request->param('name');
        $pwd = $request->param('pwd');
        if($name == ''){
            echo "<font color='red'>用户名不能为空</font>";
        }else{
            if($pwd == ''){
                echo "<font color='red'>密码不能为空</font>";
            }else{
                $where = ['name'=>$name,'pwd'=>md5($pwd)] ;
                $data =  Db::table('admin')->where($where)->find();
                if($data){
                    return 1;
                }else{
                    echo "<font color='red'>用户名或密码错误</font>";
                }
            }
        }
    }

}
