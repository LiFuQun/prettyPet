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
        }else{
            $name ='';
        }
        if (Cookie::has('volunteer')){
            $name = Cookie::get('volunteer');
        }else{
            $volunteer ='';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);

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
        }else{
            $name ='';
        }
        if (Cookie::has('volunteer')){
            $name = Cookie::get('volunteer');
        }else{
            $volunteer ='';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);

        return $this->fetch('search');
    }

    public function application(){
        if (Cookie::has('name')){
            $name = Cookie::get('name');
        }else{
            $name ='';
        }
        if (Cookie::has('volunteer')){
            $name = Cookie::get('volunteer');
        }else{
            $volunteer ='';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);
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
        }else{
            $name ='';
        }
        if (Cookie::has('volunteer')){
            $name = Cookie::get('volunteer');
        }else{
            $volunteer ='';
        }
        $this->assign('volunteer',$volunteer);
        $this->assign('name',$name);

        $id=$request->param('id');
        $data = Db::table('volunteer')->where('id',$id)->find();
//        echo dump($data);
//        exit();
        $this->assign('data',$data);
        return $this->fetch('single');
    }

}