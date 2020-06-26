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

    public function checklogin(Request $request){
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
                    $_SESSION['admin'] = $name;
                    return 1;
                }else{
                    echo "<font color='red'>用户名或密码错误</font>";
                }
            }
        }
    }

    public function delete(Request $request){
        $id = $request->param('id');
        $table = $request->param('table');
        $d = Db::table($table)->where('id',$id)->delete();
        if($d){
            echo "<script>alert('删除成功');history.back();</script>";
        }else{
            echo "<script>alert('删除失败');history.back();</script>";
        }
    }

    public function edit(Request $request){
        $id = $request->param('id');
        $table = $request->param('table');
        $data = Db::table($table)->where('id',$id)->find();
        $this->assign('table',$table);
        $this->assign('data',$data);
        return $this->fetch('edit');
    }

    public function saveEdit(Request $request){
        $table = $request->param('table');
        $id = $request->param('id');
        if($table == 'problem'){
            $data['problem'] = $request->param('problem');
            $data['message'] = $request->param('message');
        }
        if($table == 'publish'){
            $data['title'] = $request->param('title');
            $data['keyword'] = $request->param('keyword');
            $data['des'] = $request->param('des');
            $data['text'] = $request->param('text');
        }
        foreach ($data as $d){
            if($d == ''){
                echo "<script>alert('修改提交不能有空');history.go(-1);</script>";
                return;
            }
        }
        $db = Db::table($table)->where('id',$id)->update($data);
        if ($db){
            echo "<script>alert('更新成功');history.go(-1);</script>";
        }else{
            echo "<script>alert('更新失败');history.go(-1);</script>";
        }
    }
    public function showproblem(){
        $data = Db::table('problem')->order('id', 'desc')->select();
        $this->assign('data',$data);
        return $this->fetch('showproblem');
    }

    public function addproblem(){
        return $this->fetch('addproblem');
    }
    public function dealproblem(Request $request){
        $data['problem'] = $request->param('problem');
        $data['message'] = $request->param('message');
        if($data['problem'] == ''){
            echo "<script>alert('问题标题不能为空');history.go(-1);</script>";
        }else{
            if ($data['message'] == ''){
                echo "<script>alert('输入解说不能为空');history.go(-1);</script>";
            }else{
                $db = Db::table('problem')->insert($data);
                if($db){
                    echo "<script>alert('添加成功');</script>";
                    return $this->fetch('addproblem');
                }else{
                    echo "<script>alert('添加失败');</script>";
                    return $this->fetch('editproblem');
                }
            }
        }
    }
}
