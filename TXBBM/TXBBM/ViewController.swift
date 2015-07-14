//
//  ViewController.swift
//  TXBBM
//
//  Created by Baird-weng on 15/6/30.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//


import UIKit


//声明代理
class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PassWordTextfield: UITextField!
    
    @IBOutlet var test: [UIView]!
    
    //登陆的接口
    override func viewDidLoad() {
        super.viewDidLoad()
        PassWordTextfield.clearButtonMode = UITextFieldViewMode.Always
        UserNameTextField.clearButtonMode = UITextFieldViewMode.Always
        PassWordTextfield.secureTextEntry = true;
        PassWordTextfield.delegate = self
        var useDic:NSUserDefaults! = NSUserDefaults.standardUserDefaults()
        var isforKey:AnyObject! = useDic.objectForKey("userName")
        if (isforKey != nil)
        {
            UserNameTextField.text = useDic.objectForKey("userName")as!String
            PassWordTextfield.text = useDic.objectForKey("password")as!String
        }
        
        //点击手势让键盘回收
        let tap = UITapGestureRecognizer (target: self, action:"KeyboardContraction")
        self.view .addGestureRecognizer(tap)
        
        //判断是否已经登陆，如果登陆那么显示已经登陆的页面。
        var isLogin:AnyObject! = useDic.objectForKey("personinfomation")
        if (isLogin != nil){
            var storyboard:UIStoryboard! = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
            var tabbarViewController:UIViewController! = storyboard.instantiateViewControllerWithIdentifier("TXBBMTabbarViewController")as!UIViewController
            self.navigationController!.pushViewController(tabbarViewController, animated:false)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func ClickLogin(sender: UIButton) {

        if(UserNameTextField.text == ""||PassWordTextfield.text == ""){
            SVProgressHUD.showErrorWithStatus("请输入正确的用户名或密码")
        }
        else{
            var paras = TXBBMAPI.SetTheDefaultParameters()
            paras.setValue("1001",forKey:"ma")
            paras.setValue(UserNameTextField.text,forKey:"id")
            paras.setValue(PassWordTextfield.text,forKey:"password")
            SVProgressHUD.show()
            TTBBMDataNetWork.setpost(TXBBMAPI.getURL(),paras: paras, success: { (datafinish:AnyObject!) -> Void in
                var message = datafinish["message"]as! String
                var status = datafinish["status"]as!NSNumber
                var data = datafinish["data"]
                println(datafinish);
                
                
                if(status == 1){
                    SVProgressHUD.showSuccessWithStatus("登陆成功");
                    var storyboard:UIStoryboard! = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
                    var tabbarViewController:UIViewController! = storyboard.instantiateViewControllerWithIdentifier("TXBBMTabbarViewController")as!UIViewController
                    self.navigationController!.pushViewController(tabbarViewController, animated:true)
                    var useDic:NSUserDefaults! = NSUserDefaults.standardUserDefaults()
                    useDic.setObject(self.UserNameTextField.text,forKey:"userName")
                    useDic.setObject(self.PassWordTextfield.text,forKey:"password")
                    useDic.setObject(data,forKey:"personinfomation")
                }
                else{
                    SVProgressHUD.showErrorWithStatus(message);
                }
              }, error: { (error:AnyObject!) -> Void in
                SVProgressHUD.showErrorWithStatus("网络错误")
                println(error)
            })
        }
    }
    //延迟函数
    func hwcDelay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    //键盘回收的方法
    func KeyboardContraction(){
        UserNameTextField .resignFirstResponder()
        PassWordTextfield.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
}

