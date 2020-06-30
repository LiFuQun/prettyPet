<?php
/**
 * Created by PhpStorm.
 * Date: 2020/6/28
 * Time: 11:02
 */

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
        }else{
            $name ='';
        }
        $data = Db::table('station')->where('state',1)->order('id','desc')->select();
        $this->assign('data',$data);
        $this->assign('name',$name);
        return $this->fetch('station');
    }

    public function login(){
        return $this->fetch('login');
    }

    public function logout(){
        //删除
        Cookie::delete('name');
        $name ='';
        $this->assign('name',$name);
        return $this->fetch('index/index');
    }

    public function deallogin(Request $request){
        $data['name'] = $request->param('name');
        $data['pwd'] = $request->param('pwd');
        $db = Db::table('user')->where($data)->find();
        if($db){
            $sid = $db['sid'];
            // 设置Cookie 有效期为 3600秒
            Cookie::set('name',$data['name'],360000);
            echo "<script>parent.location.href='index.php?s=station/mystation/sid/".$sid."';</script>";
        }else{
            echo "<script>alert('密码或用户名错误');history.go(-1)</script>";
        }
    }

    public function mystation(Request $request){
        $sid = $request->param('sid');
        $station = Db::table('station')->where('id',$sid)->find();
        $this->assign('station',$station);
        return $this->fetch('mystation');
    }

    public function single(Request $request){
        if (Cookie::has('name')){
            $name = Cookie::get('name');
        }else{
            $name ='';
        }
        $this->assign('name',$name);

        $id=$request->param('id');
        $data = Db::table('station')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('single');
    }

    public function application(){
        return $this->fetch('application');
//        return $this->fetch('image');
    }

    public function dealapplication(){
        $data['pname']=request()->post('pname');
        $data['id_number']=request()->post('id_number');
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
            echo dump($info);
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
//            echo dump($user);
//            exit();
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

}