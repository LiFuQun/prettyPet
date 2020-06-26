<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Request;

class Blog extends Controller
{
    public function index()
    {
        return $this->blog();
    }

    public function blog(){
        $data =  Db::table('publish')->order('id', 'desc')->select();//最新动态最先输出
        //得到图片路径
        foreach ($data as $d){
            $content = $d['text'];
            $content = htmlspecialchars_decode($content);
            $pattern = '/<img.*?src="(.*?static.*?)".*?\/?>/i';
            preg_match_all($pattern,$content,$match);
            if(empty($match[1][0])){
                $path[] = './static/img/index/moren.png';
            }else{
                $path[] = $match[1][0];           //图片路径
            }
        }
        $data =  Db::table('publish')->order('id', 'desc')->select();//最新动态最先输出
        $web =  Db::table('website')->find();
        $this->assign('data',$data);
        $this->assign('web',$web);
        $this->assign('path',$path);
        return $this->fetch('blog');
    }

    public function single(Request $request){
        $qblog =  Db::table('publish')->order('id', 'desc')->limit(5)->select();//最新动态最先输出
        $id = $request->param('id');
        $data = Db::table('publish')->where('id',$id)->find();
        $content = htmlspecialchars_decode($data['text']);
        $comment = Db::table('comment')->where('pid',$id)->select();
        $this->assign('comment',$comment);
        $this->assign('data',$data);
        $this->assign('content',$content);
        $this->assign('qblog',$qblog);
        return $this->fetch('single');
    }

    public function dealcommit(Request $request){
        $data['name'] = $request->param('name');
        $data['email'] = $request->param('email');
        $data['content'] = $request->param('message');
        $data['pid'] = $request->param('pid');

        foreach ($data as $d){
            if($d == ''){
                echo '<script>alert("填写信息不能有空");history.go(-1)</script>';
                return;
            }
        }

        $insert = Db::table('comment')->insert($data);
        if ($insert){
            echo '<script>alert("留言成功");history.go(-1)</script>';
        }else{
            echo '<script>alert("留言失败");history.go(-1)</script>';
        }
    }
}
