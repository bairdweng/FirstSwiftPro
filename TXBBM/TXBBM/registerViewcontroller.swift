//
//  registerViewcontroller.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/1.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit
let registerURL = "http://api.linglingtang.com/index.php?s=/Page/index.html"

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
            
            
            var manager = AFHTTPRequestOperationManager();
            
            SVProgressHUD .show()
            
            
            println("A==="+TXBBMAPI.ToGenerateTheApi("我icwi"))
            manager.GET(registerURL,
                parameters:nil,
                success: { (operation: AFHTTPRequestOperation!,
                    responseObject: AnyObject!) in
                    
                    println("JSON: " + responseObject.description!)
                },
                failure: { (operation: AFHTTPRequestOperation!,
                    error: NSError!) in
                    println("Error: " + error.localizedDescription)
            })
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
