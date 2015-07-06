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
    //登陆的接口
    override func viewDidLoad() {
        super.viewDidLoad()
        PassWordTextfield.clearButtonMode = UITextFieldViewMode.Always
        UserNameTextField.clearButtonMode = UITextFieldViewMode.Always
        PassWordTextfield.secureTextEntry = true;
        PassWordTextfield.delegate = self
        //点击手势让键盘回收
        let tap = UITapGestureRecognizer (target: self, action:"KeyboardContraction");
        self.view .addGestureRecognizer(tap)
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
                if(status == 1){
                    SVProgressHUD.showSuccessWithStatus("登陆成功");
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

