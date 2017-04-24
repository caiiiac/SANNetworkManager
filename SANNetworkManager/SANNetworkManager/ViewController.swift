//
//  ViewController.swift
//  SANNetworkManager
//
//  Created by 唐三彩 on 2017/4/24.
//  Copyright © 2017年 唐三彩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SANNetworkManager.shareInstance.request(methodType: .POST, urlString: "http://httpbin.org/post", parameters: ["name" : "Lee"]) { (result, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            print(result!)
        }
    }
}

