//
//  PersonalcenterViewController.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/14.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit

class PersonalcenterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var personTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人中心"
        personTableView.delegate = self
        personTableView.dataSource = self
        personTableView.registerClass(PersonCell.self,forCellReuseIdentifier:"cell1");
        let nibcell = UINib(nibName:"PersonCell", bundle:nil)
        personTableView.registerNib(nibcell, forCellReuseIdentifier:"cell1")
         personTableView.registerClass(UITableViewCell.self,forCellReuseIdentifier:"cell2");
        personTableView.backgroundColor = UIColor.yellowColor()
        // Do any additional setup after loading the view.
    }
    
    //两组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section
        {
         case 0:
            return 1
        case 1:
           return 2;
        default:
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var section = indexPath.section
        
    println(section)
        
        switch section
        {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! PersonCell
            
            let UserDefaults = NSUserDefaults.standardUserDefaults()
            
            let dataDiction = UserDefaults .objectForKey("personinfomation")as!NSDictionary
            cell.usename.text = "用户名:".stringByAppendingString((dataDiction.objectForKey("name")as?String)!)
            cell.account.text = "账户:".stringByAppendingString((dataDiction.objectForKey("mobile")as?String)!)
            cell.accountmanage.addTarget(self,action:Selector("clickAccountmanage:"),forControlEvents:UIControlEvents.TouchUpInside)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! UITableViewCell
            return cell
        default:
            println("First has not li")
        }
        let cell = UITableViewCell();
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }
    //点击账户管理
    func clickAccountmanage(sender:UIButton!){        
        var storyboard:UIStoryboard! = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
        var tabbarViewController:UIViewController! = storyboard.instantiateViewControllerWithIdentifier("AccountManagement")as!UIViewController
        self.navigationController!.pushViewController(tabbarViewController, animated:true)
        
        
    
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
