<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;
session_start();

class Index extends Controller
{
    public function index()
    {
      return $this->login();
    }

    public function main(){
        $admin = $_SESSION['admin'];
//        $admin = "name";
        $this->assign('admin',$admin);
        return $this->fetch('main');
    }

    public function login(){
        return $this->fetch('login');
    }

    public function showmeg(Request $request){
        $id = $request->param('id');
        $data = Db::table('msg')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('showmeg');
    }

    public function message()
    {
        $data = Db::table('msg')->order('id', 'desc')->select();
        $this->assign('data', $data);
        return $this->fetch('message');
    }

    public function delete(Request $request)
        {
            $id = $request->param('id');
            $table = $request->param('table');
            $d = Db::table($table)->where('id', $id)->delete();
            if ($d) {
                echo "<script>alert('删除成功');history.back();</script>";
            } else {
                echo "<script>alert('删除失败');history.back();</script>";
            }
        }

}
