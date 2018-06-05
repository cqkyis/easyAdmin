<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/30 0030
 * Time: 16:22
 */

namespace app\weixin\controller;


class User
{

    public function wxlogin(){
    $id = input('id');
    $nickname = input('nickname');
    $face = input('face');
    $list = db('system_user')->where('openid',$id)->find();
    if($list){
        //有值就是登录
        return json($list);
    }else{
        //没有值就新添加用户
        $data['openid']=$id;
        $data['nickname']=$nickname;
        $data['face']=$face;
        $data['login_ip']=request()->ip();
        $data['creattime']=time();
        db('system_user')->insert($data);
        $userId = db('system_user')->insertGetId($data);
        $res = db('system_user')->where('uid',$userId)->find();
        return json($res);
    }


    }

    public function getOpenId(){
        $code = input('code');
        $res = db('system_weixin')->where('type',2)->find();
        $appid = $res['appid'];
        $appsecret = $res['appsecret'];
        $c= file_get_contents("https://api.weixin.qq.com/sns/jscode2session?appid=".$appid."&secret=".$appsecret."&js_code=".$code."&grant_type=authorization_code");
        return json($c);
    }


    public function address(){
        $id = input('uid');
        $list = db('system_user_address')->where('uid',$id)->select();
        return json($list);
    }


    /**
     * 购物车使用
     */
    public function selectaddress(){
        $uid = input('uid');
        $adid = input('adid');
        $map[] = ['uid','=',$uid];
        if($adid){
            $map[] = ['adId','=',$adid];

        }
        $list = db('system_user_address')->where($map)->find();
        if($list){
            return json(['address'=>$list,'code'=>1]);
        }else{
            return json(['code'=>2]);
        }

    }

}