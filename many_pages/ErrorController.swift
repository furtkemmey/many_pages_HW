//
//  ErrorController.swift
//  many_pages
//
//  Created by 梁老師 on 2018/1/22.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

class ErrorController: UIViewController {

    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timer = Timer(timeInterval: 5, repeats: true, block:{ (t) in print("5秒到了")})
        
        timer = Timer(timeInterval: 5, repeats: true){
            (t)
            in
            print("5秒到了")
            self.performSegue(withIdentifier: "time_up_back", sender: nil)
            
        }
        //發動計時器區要一種叫RunLoop的物件
        let rp:RunLoop = RunLoop.current
        rp.add(timer, forMode: RunLoopMode.commonModes)

        // Do any additional setup after loading the view.
    }

  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
