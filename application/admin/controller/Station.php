<?php

namespace app\admin\controller;
use function PHPSTORM_META\elementType;
use function Sodium\compare;
use think\Controller;
use think\Request;
use think\Db;


class Station extends Controller
{
    public function index(){
        $data = Db::table('station')->order('id','desc')->select();
        $this->assign('data',$data);
        return $this->fetch('station');
    }

    public function single(Request $request){
        $id = $request->param('id');
        $data = Db::table('station')->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('single');
    }

    public function dealapplication(Request $request){
        $flag = $request->param('flag');
        $id = $request->param('id');
        if($flag == 1){
            //驿站申请通过
            $data['state'] = 1;
            $str = '申请通过设置成功';
        }else if ($flag==2){
            //驿站经营异常
            $data['state'] = 2;
            $str = '异常设置成功';
        }else if ($flag == 3){
            //驿站审核不通过
            $data['state'] = 3;
            $str = '不通过设置成功';
        }
        $db = Db::table('station')->where('id',$id)->update($data);
        if($db){
            echo "<script>alert(\"".$str."\");history.go(-1)</script>";
        }else{
            echo "<script>alert('设置失败');history.go(-1)</script>";
        }
    }

    public function state(Request $request){
        $flag = $request->param('flag');
        $data = Db::table('station')->where('state',$flag)->select();
        $this->assign('data',$data);
        $this->assign('flag',$flag);
        return $this->fetch('state');
    }
}