//
//  registerViewcontroller.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/1.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit
class registerViewcontroller: UIViewController {
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        PassWordTextField.clearButtonMode = UITextFieldViewMode.Always
        UserNameTextField.clearButtonMode = UITextFieldViewMode.Always
        PassWordTextField.secureTextEntry = true;
        //点击手势让键盘回收
        var tap = UITapGestureRecognizer (target: self, action:"KeyboardContraction");
        self.view .addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ClickRegister(sender: AnyObject) {
        if(UserNameTextField.text == ""||PassWordTextField.text == ""){
            SVProgressHUD .showErrorWithStatus("请输入正确的用户名或密码")
        }
            //开始注册
        else{
            var manager = AFHTTPRequestOperationManager()
            SVProgressHUD.show()
            var paras = TXBBMAPI.SetTheDefaultParameters()
            paras.setValue("1003",forKey:"ma")
            paras.setValue(UserNameTextField.text,forKey:"mobile")
            paras.setValue(PassWordTextField.text,forKey:"password")
            println(paras)
            TTBBMDataNetWork.setpost(TXBBMAPI.getURL(),paras:paras,success:{(datas:AnyObject!)-> Void in
                println(datas);
                var message = datas["message"]as! String
                SVProgressHUD.showErrorWithStatus(message)
                println(message)
//                   UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                var story = UIStoryboard(name:"main", bundle:NSBundle .mainBundle())
                var tabbar = story.instantiateViewControllerWithIdentifier("TXBBMTabbarViewController")as!UITabBarController;
                
//                self.navigationController?.pushViewController(tabbar, animated:false);
                
                
                }, error: { (error:AnyObject!) -> Void in
                    println("错误")
            });
        }
    }


    
    
    //键盘回收的方法
    func KeyboardContraction(){
        UserNameTextField .resignFirstResponder()
        PassWordTextField.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
