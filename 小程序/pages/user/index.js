var orders= require("../../utils/common.js");


Page({
  data: {
   nickname:'登录/注册',
   face:'../../common/images/icon.png'

  },
  onLoad:function(){
    var userInfo = wx.getStorageSync('user');
    
  },
  onShow:function(){
    //获取用户信息
    var userInfo = wx.getStorageSync('user');
    var that = this;
    if(!userInfo){
      
      this.setData({
        nickname:'登录/注册',
        face: '../../common/images/icon.png'
      })
    }else{
      
     
      this.setData({
        nickname:userInfo.nickname,
        face:userInfo.face
      });
      //查询用户订单
      that.showOrder(userInfo.uid);
    }


  },
  showOrder:function(res){
    //此处查询订单的多种状态
    var that = this;
    wx.request({
      url: orders.ShowOrders,
      data:{
          uid:res
      },
      success:function(r){
        console.log(r);
        that.setData({
          nopay:r.data.nopay,
          send:r.data.send,
          sendtime:r.data.sendtime,
          outpay:r.data.outpay,
          orderbj:r.data.orderbj
        })
      }
    })
  },
  set:function(){
    wx.navigateTo({
      url: 'set/index'
    })
  },
  address:function(){
    var userInfo = wx.getStorageSync('user');
   
    if (!userInfo) {
     wx.showToast({
       title: '你还没有登录,请先登录',
       icon: 'none',
       duration: 2000
     })
     setTimeout(function () {
       wx.navigateTo({
         url: 'login/login'
       })  
     }, 2000)

      

    }else{
      
      wx.navigateTo({
        url: 'address/list?userId='+userInfo.uid
      })
    }


    
  },
  login:function(){
    wx.navigateTo({
      url: 'login/login'
    })
  }

})