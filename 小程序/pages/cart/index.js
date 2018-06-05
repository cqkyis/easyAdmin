var app = getApp();
var CartJs = require("../../utils/cart.js");
var Orders = require("../../utils/common.js");
var allgood=null;

Page({
  data: {
    goodlist:'',
    types:'hide',
    headerhide:'show',
    allprice:'',
    paidprice:'',
    relaprice:'',
    feeprice:'0'
   
  },
  onLoad: function () {
    var self  = this;
    wx.setNavigationBarTitle({
      title: '我的购物车',
    });
    wx.request({
      url: Orders.MallConfig,
      success: function (r) {
        console.log(r);
        
        self.setData({
          feeprice: r.data.postprice,
          sendtime: r.data.sendtime,
          pm: r.data.mprice
        })
         wx.setStorageSync('pm', r.data.mprice);
       
      }
    });
  
  },
    onShow: function () {
     
      var that = this;
       //var pmt=1;
    
       
      var pm = wx.getStorageSync('pm');  
         
      var Cart = wx.getStorageSync('cart');
      
      
      if (!Cart) {
            
             that.setData({
               goodlist: "",
               headerhide: 'show',
               types: 'hide'
             });
             wx.removeTabBarBadge({
               index: 1
             })
      }else{
      
       // console.log(wx.getStorageSync('cart'));
         
        allgood = Cart.productlist;
      
     if(parseFloat(Cart.totalAmount)>=pm){
     
       that.setData({
         mm:'hide',
         feeprice:0
       });

     }else{
      
       
       that.setData({
         mm:'show',
         cm: (parseFloat(pm)- parseFloat(Cart.totalAmount)).toFixed(2),
         feeprice: 0 
       })
     }
console.log("fdsafdsafdsa"+that.data.feeprice);
        var relaprice = (parseFloat(Cart.totalAmount) + parseFloat(that.data.feeprice)).toFixed(2);
        console.log(relaprice);
        that.setData({
          goodlist: Cart.productlist,
          headerhide:'hide',
          types:'show',
          allprice: Cart.totalAmount,
          relaprice: relaprice
        });
       
          wx.setTabBarBadge({
            index: 1,
            text: Cart.totalNumber.toString()
          })
       
       
      }
  },
  add:function(e){
    var that = this;
    var id = e.currentTarget.dataset.id;
    console.log(id);
    var good = allgood;
    for (var i in good) {
      if (good[i]['good_id'] == id) {

        good[i]['num'] = good[i]['num'] + 1;
       }

    }
   that.setData({
     goodlist: good,
   })
   CartJs.AddCart(id);
   that.onShow();
  },
  del:function(e){
    var that = this;
    var id = e.currentTarget.dataset.id;
    console.log(id);
    var good = allgood;
    for (var i in good) {
      if (good[i]['good_id'] == id) {

        good[i]['num'] = good[i]['num']- 1;
       
      }

    }
    that.setData({
      goodlist: good,
    })
    CartJs.UpdataNum(id);
    that.onShow();
    

  },
  creatOrder:function(){
    // wx.navigateTo({
    //   url: 'order/pay',
    // })
    var that = this;
    //console.log(Logins.userInfo());
    var userInfo = wx.getStorageSync('user');
    console.log(wx.getStorageSync('user'));
    var cart = wx.getStorageSync('cart');
    var feeprice = that.data.feeprice;
    console.log("这是什么呢" + feeprice)
    console.log(cart);
    if(!userInfo){
      //没有值的情况下
      wx.showToast({
        title: '你还没有登录',
        icon: 'none',
        duration: 2000
      })
      setTimeout(function(){
        wx.navigateTo({
          url: '../user/login/login',
        })
      },2000)
      //console.log(1);
    }else{
      console.log(2);
     //点击结算就创建订单
      wx.request({
        url: Orders.Order,
        data:{
         uid:userInfo.uid,
         cart:cart,
         postprice: feeprice
        },
        success:function(e){
          console.log(e);
          //创建成功就到另一个页面
          if (e.data.code == 1) {
            wx.removeStorageSync('cart');
            that.onShow();
            wx.setStorageSync('code', e.data.ordercode);
            wx.navigateTo({
              url: 'order/pay'
            })
          }else{
            wx.showToast({
                  title: '创建订单失败',
                  icon:"none",
                  duration:1500
                })
          }
         
        }
      })

    }
  }

})