//
//  TTBBMDataNetWork.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/1.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit

class TTBBMDataNetWork: NSObject {
    typealias datafinish = (AnyObject)->Void
    static var errorClosuer:datafinish?
    static var successClosuer:datafinish?
    //网络请求，二次封装
    static func setpost(URL:String!,paras:AnyObject!,success:datafinish,error:datafinish){
        errorClosuer = error
        successClosuer = success
        var manager = AFHTTPRequestOperationManager();
        manager.POST(URL,
            parameters:paras,
            success:
            {(operation:AFHTTPRequestOperation!,
            responseObject:AnyObject!)in
                if((self.successClosuer) != nil){
                   self.successClosuer!(responseObject)
                }
            },failure:
            {(operation:AFHTTPRequestOperation!,
                error:NSError!)in
                if((self.errorClosuer) != nil){
                    self.errorClosuer!(error)
                }
        })
}
    
}
