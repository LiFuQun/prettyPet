<?php

namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;
use think\facade\Cookie;

class Station extends Controller
{

    public function station(){
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

        $data = Db::table('station')->where('state',1)->order('id','desc')->select();
        $this->assign('data',$data);
        return $this->fetch('station');
    }

    public function login(){
        return $this->fetch('login');
    }

    public function logout(){
        //删除
        Cookie::delete('name');
        Cookie::delete('sid');
        $name = '';$sid = '';

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

        return $this->fetch('index/index');
    }

    public function deallogin(Request $request){
        $data['name'] = $request->param('name');
        $data['pwd'] = $request->param('pwd');
        $db = Db::table('user')->where($data)->find();
        if($db){
            $sid = $db['sid'];
            if($db['role'] != '驿站'){
                echo "<script>alert('该账号不是驿站账号');history.go(-1)</script>";
                return;
            }else {
                Cookie::set('name', $data['name'], 360000);
                Cookie::set('sid',$sid,360000);
                if (Cookie::has('volunteer')){
                    Cookie::delete('volunteer');
                }
                echo "<script>parent.location.href='index.php?s=station/mystation/sid/" . $sid . "';</script>";
            }
        }else{
            echo "<script>alert('密码或用户名错误');history.go(-1)</script>";
        }
    }

    public function mystation(Request $request){
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

        $sid = $request->param('sid');
        $station = Db::table('station')->where('id',$sid)->find();
        $this->assign('station',$station);
        return $this->fetch('mystation');
    }

    public function single(Request $request){
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

        $id=$request->param('id');
        $data = Db::table('station')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('single');
    }

    public function application(){
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

        return $this->fetch('application');
    }

    public function dealapplication(){
        $data['pname']=request()->post('pname');
        $data['id_number']=request()->post('id_number');
        if(strlen($data['id_number'])>20){
            echo "<script>alert('输入身份证长度超过20位');history.go(-1)</script>";
            return;
        }
        if(strlen($data['id_number'])<10){
            echo "<script>alert('输入身份证长度少于10位');history.go(-1)</script>";
            return;
        }
        $data['sname']=request()->post('sname');
        $data['des']=request()->post('des');
        $data['address'] = request()->post('address');
        $path = [];
//        $files = $request->param('image');
        $files = request()->file('image');
//        echo dump($files);exit();
        foreach($files as $file){
            // 移动到框架应用根目录/uploads/ 目录下
            $info = $file->move( './static/upload/station/application');
//            echo dump($info);
            if($info){
                // 成功上传后 获取上传信息
                $str = $info->getSaveName();
                $path[] = ".\\static\\upload\\station\\application\\".$str;
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }

        $data['sphotos'] = $path[0];
        $data['zheng'] = $path[1];
        $data['fan'] = $path[2];
        $data['photos'] = $path[3];

//        echo dump($data);exit();
        foreach ($data as $d){
            if($d == ''){
                echo "<script>alert('".$d."输入不能为空');history.go(-1)</script>";
                return;
            }
        }
        $data['state']=0;
        $db = Db::table('station')->insert($data);
        if ($db){
            $user['name'] = $data['pname'];
            $user['sid'] =  Db::name('station')->getLastInsID();   //获取当前驿站申请插入的id建立用户的外键
            $user['pwd'] = substr($data['id_number'],-4);
            $user['role'] = '驿站';

            $db = Db::table('user')->insert($user);

            if($db){
                echo "<script>alert('提交成功');history.go(-1)</script>";
            }else{
                $f['state'] = 4;
                $re = Db::table('station')->where('id',$user['sid'])->update($f);
                echo "<script>alert('设置失败');history.go(-1)</script>";
            }
        }else{
            echo "<script>alert('提交失败');history.go(-1)</script>";
        }
    }

    public function search(Request $request){
        $select = $request->param('select');
        $search = $request->param('search');
        $data = Db::table('station')->whereLike($select,'%'.$search.'%')->select();
        if($data == array(0)){
            return;
        }
        $this->assign('data',$data);

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

        return $this->fetch('search');
    }


}