//
//  ViewController.swift
//  many_pages
//
//  Created by 梁老師 on 2018/1/22.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    
    @IBOutlet var password: UITextField!
    
    var is_member:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login2(_ sender: UIButton) {

        let path_to_data = Bundle.main.path(forResource: "members2", ofType: "csv")!
        var members:String = ""
        do{
            members = try String(contentsOfFile: path_to_data)
        }catch{
            print("喔！出錯了！！")
            is_member = false
        }
        let trim_members = members.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let lines = trim_members.components(separatedBy: "\n")
        for line in lines{
            let columns = line.components(separatedBy: ",")
            if account.text == columns[1]  &&  password.text == columns[2]{
                is_member = true
                break
            }else{
                is_member = false
            }
        }
        if is_member {
            self.performSegue(withIdentifier: "ok", sender: sender)
        }else{
            self.performSegue(withIdentifier: "error", sender: sender)
        }
        
    }
    
    @IBAction func login() {
        /*
        if account.text == "john"{
            print("帳號正確")
            if password.text == "1234"{
                print("welcome")
            }else{
                print("密碼有誤")
            }
            
        }else{
            
            print("帳號有誤")
        }
        */
        
        //////資料儲存在外部檔案members.csv  ---> comma seperate value
        /////讀取 members.csv
        
        
        
        let path_to_data = Bundle.main.path(forResource: "members2", ofType: "csv")!
        
        //凡是函數有 throw 標記的！！！都是屬於一種有可能在執行時出錯的指令！！！
        //只要是這種指令！swift要求程式設計師一定要處理"萬一"出錯的狀況！swift提供
        //  do - try -catch 語法來讓程式設計師操作
        
        /* do - try - catch語法
        
         do{
         
             try 可能會在執行街端出錯的程式碼(函數)
         
         }carch{
         
             萬一出錯！系統會跳到這個{}中來執行(不會像其他語言，有的就這麼當掉了！！)
         
         }
        
        
        */
        var members:String = ""
        do{
            
           members = try String(contentsOfFile: path_to_data)
        
        }catch{
           print("喔！出錯了！！")
           //做一些高明的處理
           is_member = false
        }
        
        
        
        print(members)
        let trim_members = members.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let lines = trim_members.components(separatedBy: "\n")
        print(lines)
        
        for line in lines{
            
            let columns = line.components(separatedBy: ",")
            
            if account.text == columns[1]  &&  password.text == columns[2]{
                
                print("welcome")
                is_member = true
                break
            }else{
                
                print("帳密有誤")
                is_member = false
            }
            
        }
        
       
        
    
        
    }
    /*
    /////覆寫- override segue控制函數，使之依我的要求發動執行
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return is_member
    }
    */
    
    
    ////若你是以segue換到新的一頁，而想回來原本的這裡！
    ////你必須為segue的回來提供一個程式接口(否則就是單程只能去了！)
    ////這個接口是以函數的型式提出，有一定的規範(名字可以隨便取)
    
    @IBAction func 錯誤回來的接口函數(參數名字隨便:UIStoryboardSegue){
        
        //只要有這個接口，就能從去的地方回來，倒是不一定要寫什麼程式內容
        //因為這個函數會在有segue回來時被呼叫！所以寫在這裡的程式會在segue回來後執行
        print("ただいま")
        
    }
    
    @IBAction func 時間到(參數名字隨便:UIStoryboardSegue){
        
        //只要有這個接口，就能從去的地方回來，倒是不一定要寫什麼程式內容
        //因為這個函數會在有segue回來時被呼叫！所以寫在這裡的程式會在segue回來後執行
        print("ただいま2")
        
    }
    
}

