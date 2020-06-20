<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;

class Index extends Controller
{
    public function index()
    {
        return $this->contact();
    }

    public function contact(){
        $data =  Db::table('website')->find();
        $this->assign('data',$data);
        return $this->fetch('contact');
    }
}
