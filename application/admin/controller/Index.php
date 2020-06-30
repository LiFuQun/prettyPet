<?php
namespace app\admin\controller;
use function Sodium\compare;
use think\console\command\optimize\Schema;
use think\Controller;
use think\Request;
use think\Db;

session_start();

class Index extends Controller
{
    public function index()
    {
//        $admin = "name";
//        $this->assign('admin',$admin);
        return $this->fetch('login');
    }

    public function home(){
            $baike = Db::table('baike')->count();
            $this->assign('baike',$baike);
            $classb = Db::table('classb')->count();
            $this->assign('classb',$classb);
           $blog = Db::table('publish')->count();
           $this->assign('blog',$blog);
           $station = Db::table('station')->count();
           $this->assign('station',$station);
           $volunteer = Db::table('volunteer')->count();
           $this->assign('volunteer',$volunteer);
             $msg = Db::table('msg')->count();
             $this->assign('msg',$msg);
             $problem = Db::table('problem')->count();
             $this->assign('problem',$problem);
            return $this->fetch('home');
    }

    public function search(Request $request){
        $table = $request->param('table');
        $search = $request->param('search');
        $value = $request->param('value');

        $t = array(
            'station'=>array('宠物驿站','station'),
            'volunteer'=>array('志愿者','volunteer'),
            'problem'=>array('宠物常见问题','index'),
            'baike'=>array('宠物百科','baike'),
            'publish'=>array('宠物博客','blog'),
        );
//        echo $t[$table];exit();
        $data = Db::table($table)->whereLike($search,'%'.$value.'%')->select();

        $this->assign('data',$data);
        $this->assign('table',$t[$table][0]);

        $filename = $t[$table][1].'/search';

//        echo $t[$table][0].'<br>',$t[$table][1];exit();
        return $this->fetch($filename);
    }

    public function main(){

        try{
            $admin = $_SESSION['admin'];
            $this->assign('admin',$admin);
            return $this->fetch('main');
        }catch(\Exception $e){
            echo "<script>alert('请先登录后台'); window.location.href='admin.php?s=index/index';</script>";
        }
    }

    public function showmeg(Request $request){
        $id = $request->param('id');
        $data = Db::table('msg')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('showmeg');
    }

    public function message(){
        $data = Db::table('msg')->order('id', 'desc')->select();
        $this->assign('data',$data);
        return $this->fetch('message');
    }

    public function web(){
        $data =  Db::table('website')->find();
        $this->assign('data',$data);
        return $this->fetch('web');
    }
    public function delete(Request $request){
        $id = $request->param('id');
        $table = $request->param('table');
        $d = Db::table($table)->where('id',$id)->delete();
        if($d){
            echo "<script>alert('删除成功');history.go(-1);</script>";
        }else{
            echo "<script>alert('删除失败');history.go(-1);</script>";
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
            echo dump($data);
        }
        if($table == 'website'){
            $data['webname'] = $request->param('webname');
            $data['phone'] = $request->param('phone');
            $data['Operating_hours'] = $request->param('Operating_hours');
            $data['email'] = $request->param('email');
            $data['address'] = $request->param('address');
        }
        if($table == 'baike'){
            $data['name'] = $request->param('name');
            $data['classb'] = $request->param('classb');
            $data['img'] = $request->param('img');
            $data['des'] = $request->param('des');
            $data['content'] = $request->param('content');
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
    public function showproblems(){
        $list =Db::table('problem')->order('id', 'desc')->select();
        $this->assign('data', $list);
        return $this->fetch('showproblems');
    }

    public function showproblem(){
        $list =Db::table('problem')->order('id', 'desc')->select();
        $this->assign('data', $list);
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


    //展示发布内容的页面
    public function publish(){
        return $this->fetch('publish');
    }

    //登录页面
    public function login(){
        return $this->fetch('login');
    }

    //检查登录的信息
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
//                    session_start();
                    $_SESSION['admin'] = $name;
                    return 1;
                }else{
                    echo "<font color='red'>用户名或密码错误</font>";
                }
            }
        }
    }

    public function logout(){
        session_destroy();
        echo "<script>window.location.href='admin.php?s=index/index';</script>";
    }
}
