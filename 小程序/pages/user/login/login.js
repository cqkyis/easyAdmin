// pages/user/login/login.js

var Logins = require("../../../utils/common.js");

Page({

  /**
   * 页面的初始数据
   */
  data: {
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    $loading: {
      isShow: false
    },
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.setNavigationBarTitle({
      title: '会员登录',
    });
   
  },
  bindGetUserInfo: function (e) {
    var that = this;
    that.setData({
      $loading: {
        isShow: true
      },
    })
    console.log(e);
    var openid;
   //console.log(e.detail.userInfo)
   //获取用户的code
   wx.login({
     success:function(res){
 if(res.code){
       wx.request({
         url: Logins.OpenId,
         data:{
           code:res.code
         },
         success:function(r){
           console.log(r);
           var v=JSON.parse(r.data);
           console.log(JSON.parse(r.data));
           openid=v.openid;
           console.log(openid);
          //成功后将数据保存到本地数据库
          wx.request({
            url: Logins.Wxlogin,
            data:{
              id:openid,
              nickname:e.detail.userInfo.nickName,
              face: e.detail.userInfo.avatarUrl
            },
            success:function(data){
              that.setData({
                $loading: {
                  isShow: false
                },
              })
              wx.setStorageSync('user', data.data);
              wx.showToast({
                title: '登录成功',
               
                icon: 'success',
                duration: 2000
              });
              setTimeout(function () {
                //要延时执行的代码  
                wx.switchTab({
                  url: '../index',
                  success: function (e) {
                    var page = getCurrentPages().pop();
                    if (page == undefined || page == null) return;
                    page.onLoad();

                  }
                })
              }, 2000)
              
              
            }
          })

         }
       })
 }else{
   console.log('登录失败！' + res.errMsg)
 }

     }
   })
  },
  

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})