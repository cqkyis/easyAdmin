<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/1 0001
 * Time: 08:24
 */

namespace app\weixin\controller;


use think\Controller;
use Wechat\Lib\Tools;
use Wechat\Loader;



class Pay extends Controller
{

    //实现支付功能
    public function payOrder()
    {
        $url = $this->request->root(true)."/weixin/pay/Notify";
        //$root = $this->request->root(true);
        //dump($root);
        $openid=input('openid');//'o1_R_4s1pTcQdis6flGqLEq0FX9o';
        $body='幸福优鲜订单';
        $order_sn=input('order_sn');//'15277396413732069451';
        $total_fee=input('total_fee');//0.01;
        $config = db('system_weixin')->where('type',2)->find();
        //配置统一下单
        $data =array(
            'appid'         => $config['appid'],
            'mch_id'        => $config['mch_id'],
            'nonce_str'     => Tools::createNoncestr(),
            'body'          => $body,
            'out_trade_no'  => $order_sn,
            'total_fee'     => $total_fee * 100,
            'spbill_create_ip'  =>Tools::getAddress(),
            'notify_url'    => $url,
            'trade_type'    => 'JSAPI',
            'openid'        => $openid
        );
        $data['sign']=Tools::getPaySign($data,$config['partnerkey']);
        $urls="https://api.mch.weixin.qq.com/pay/unifiedorder";
        $res = Tools::httpsPost($urls,Tools::arr2xml($data));
        $content = Tools::xml2arr($res);

        $opt = array(
            'appid' => $config['appid'], // 填写高级调用功能的app id, 请在微信开发模式后台查询
            'appsecret' => $config['appsecret'], // 填写高级调用功能的密钥
            'mch_id'=>$config['mch_id'],
            'partnerkey'=>$config['partnerkey']
         );
        $pay = Loader::get('Pay',$opt);
        $options = $pay->createMchPay($content['prepay_id']);
         return json($options) ;
       }


       //处理支付的订单
    public function Notify(){
        $pay = Loader::get('Pay');
        $notifyInfo = $pay->getNotify();
        if($notifyInfo===FALSE){
            // 接口失败的处理
            echo $pay->errMsg;
        }else{
            //支付通知数据获取成功
            if ($notifyInfo['result_code'] == 'SUCCESS' && $notifyInfo['return_code'] == 'SUCCESS') {
                db('order')->where('ordercode',$notifyInfo['out_trade_no'])->update([
                    'stauts'=>1
                ]);
                return xml(['return_code' => 'SUCCESS', 'return_msg' => 'DEAL WITH SUCCESS']);
          }
        }
    }

}