<?php

namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;
use think\facade\Cookie;
class Baike extends Controller
{
    public function baike(){
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

        $data1 = Db::table('baike')->where('classb','猫')->select();
        $data2 = Db::table('baike')->where('classb','狗')->select();
        $data3 = Db::table('baike')->where('classb','其他')->select();

        $this->assign('data1',$data1);
        $this->assign('data2',$data2);
        $this->assign('data3',$data3);
        return $this->fetch('baike');
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

        $id = $request->param('id');
        $data = Db::table('baike')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('single');
    }

    public function search(Request $request){
        $select = $request->param('select');
        $search = $request->param('search');
        $data = Db::table('baike')->whereLike($select,'%'.$search.'%')->select();
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