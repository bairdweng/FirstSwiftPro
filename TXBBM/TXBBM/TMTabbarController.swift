//
//  TMTabbarController.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/14.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit

class TMTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏左边的按钮
        let baritem = UIBarButtonItem(customView: UIView())
        self.navigationItem.leftBarButtonItem = baritem

        // Do any additional setup after loading the view.
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
