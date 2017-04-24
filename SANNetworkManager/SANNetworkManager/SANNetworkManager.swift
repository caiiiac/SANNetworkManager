//
//  SANNetworkManager.swift
//  SANNetworkManager
//
//  Created by 唐三彩 on 2017/4/24.
//  Copyright © 2017年 唐三彩. All rights reserved.
//

import AFNetworking

enum RequestType : String{
    case GET = "GET"
    case POST = "POST"
}

class SANNetworkManager: AFHTTPSessionManager {

    static let shareInstance : SANNetworkManager = {
       let manager = SANNetworkManager()
        manager.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return manager
    }()
}


//MARK: - 封装请求方法
extension SANNetworkManager {
    func request(methodType : RequestType, urlString : String, parameters : [String : Any], finished : @escaping
        (Any?, Error?) -> ()) {
    
        //定义成功后的回调
        let successCallBack = { (task : URLSessionDataTask, result : Any?) in
            finished(result, nil)
        }
        //定义失败后的回调
        let failureCallBack = { (task : URLSessionDataTask?, error : Error) in
            finished(nil, error)
        }
        
        
        if methodType == .GET {
            self.get(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
        else
        {
            self.post(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
    }
}
