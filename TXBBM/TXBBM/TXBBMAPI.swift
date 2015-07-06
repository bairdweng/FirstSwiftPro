//
//  TXBBMAPI.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/1.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//


import UIKit
class TXBBMAPI: NSObject {
    //有参数和没有返回值。
   typealias fuckblock = (String)->Void
    //声明一个闭包,问号表示有可能是nil
   static var myclosuer:fuckblock?
    //闭包方法
    static func setClosure(Url:String,closure:fuckblock) {
    myclosuer = closure
    if (myclosuer != nil){
        myclosuer!(Url)
    }
 }
    //设置参数
    static func SetTheDefaultParameters()->NSMutableDictionary{
        var MutableDictionary:NSMutableDictionary = ["partner_secret":"OTczNkQwcmxYZnNlOURvV0lSN0x4YkMvaC90V3FVdUVtSm1ENytneVpFWGlIaHpwVEhzNkJGZUJZMEYzZ1c0","partner":"16080000008"]
        return MutableDictionary
    }
    //获取URL
    static func getURL()->String{
        return "http://api.linglingtang.com/index.php?s=/Page/index.html"
    }
}
