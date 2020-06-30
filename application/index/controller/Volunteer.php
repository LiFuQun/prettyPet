<?php

namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;
use think\facade\Cookie;

class Volunteer extends Controller
{
    public function volunteer(){
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

        $data = Db::table('volunteer')->where('state',1)->select();
        $this->assign('data',$data);

        $excellent = Db::table('volunteer')->where('state',1)->order('rank','desc')->limit(10)->select();
        $this->assign('excellent',$excellent);
        return $this->fetch('volunteer');

    }

    public function search(Request $request){
        $select = $request->param('select');
        $search = $request->param('search');
        $data = Db::table('volunteer')->whereLike($select,'%'.$search.'%')->select();
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

        return $this->fetch('volunteer/application');
    }

    public function dealvolunteer(){
        $data['tname'] = request()->post('tname');
        $data['number'] = request()->post('number');
        $data['zname'] = request()->post('zname');
        $data['address'] = request()->post('address');
        $data['degree'] = request()->post('degree');
        $data['position'] = request()->post('position');
        $data['des'] = request()->post('des');
        $data['exp'] = request()->post('exp');
        $path = [];
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
        $data['head'] = $path[0];
        $data['zheng'] = $path[1];
        $data['fan'] = $path[2];
        $data['sphotos'] = $path[3];

//        echo dump($data);exit();
        foreach ($data as $d){
            if($d == ''){
                echo "<script>alert('".$d."输入不能为空');history.go(-1)</script>";
                return;
            }
        }
        $data['state']=0;
//        echo dump($data);exit();
        $db = Db::table('volunteer')->insert($data);
        if ($db){
            $user['name'] = $data['tname'];
            $user['sid'] =  Db::name('volunteer')->getLastInsID();   //获取当前驿站申请插入的id建立用户的外键
            $user['pwd'] = substr($data['number'],-4);
            $user['role'] = '志愿者';
//            echo dump($user);
//            exit();
            $db = Db::table('user')->insert($user);

            if($db){
                echo "<script>alert('提交成功');history.go(-1)</script>";
            }else{
                $f['state'] = 3;
                $re = Db::table('volunnteer')->where('id',$user['sid'])->update($f);
                echo "<script>alert('设置失败');history.go(-1)</script>";
            }
        }else{
            echo "<script>alert('提交失败');history.go(-1)</script>";
        }
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
        $data = Db::table('volunteer')->where('id',$id)->find();
//        echo dump($data);
//        exit();
        $this->assign('data',$data);
        return $this->fetch('single');
    }

    public function myvolunteer(Request $request){
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
        $data = Db::table('volunteer')->where('id',$sid)->find();
        $this->assign('data',$data);
        return $this->fetch('myvolunteer');
    }

    public function login(){
        return $this->fetch('login');
    }
    public function logout(){
        //删除
        Cookie::delete('volunteer');
        Cookie::delete('vid');
        $volunteer = '';$vid = '';
        $volunteer ='';
        if (Cookie::has('name')){
            $name = Cookie::get('name');
            $sid = Cookie::get('sid');
        }else{
            $name ='';
            $sid = '';
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
            if($db['role'] != '志愿者'){
                echo "<script>alert('该账号不是志愿者账号');history.go(-1)</script>";
            }else{
                $sid = $db['sid'];
                // 设置Cookie 有效期为 3600秒
                Cookie::set('volunteer',$data['name'],360000);
                Cookie::set('vid',$sid,360000);
                if (Cookie::has('name')){
                    Cookie::delete('name');
                }
                echo "<script>parent.location.href='index.php?s=volunteer/myvolunteer/sid/".$sid."';</script>";
            }
        }else{
            echo "<script>alert('密码或用户名错误');history.go(-1)</script>";
        }
    }

}