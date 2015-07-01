//
//  TTBBMDataNetWork.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/1.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit

class TTBBMDataNetWork: NSObject {
   
    
   class func postURL(sender:String,Mutabledic:NSMutableDictionary)->AnyObject{
    var manager = AFHTTPRequestOperationManager();
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

    
    manager.POST(registerURL,
        parameters:nil,
        success:{ (test1:AFHTTPRequestOperation!,
            test2:AnyObject!)in
            
            
            },
        failure:{(test2:AFHTTPRequestOperation!,
            error:NSError!)in
            
    })
    
        
    
    
    
    
    
    
        return"wewe"
    }
    
    
    
    
    
}
