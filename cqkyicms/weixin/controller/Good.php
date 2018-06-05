<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/3 0003
 * Time: 17:47
 */

namespace app\weixin\controller;


use think\Controller;

class Good extends Controller
{

    public function setting(){
        $res = db('good_config')->find();
        if($res){
            return json($res);
        }else{
            return json(['code'=>1]);
        }
    }

}