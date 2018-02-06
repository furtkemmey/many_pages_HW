//
//  AppDelegate.swift
//  many_pages
//
//  Created by 梁老師 on 2018/1/22.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //在程式啟動完成，這個函數return true就會顯示storyboard上的畫面了
        //所以如果要用不同的storyboard，就在這裡了
        
        //先偵測現在的硬體是?
        
        /*
        //工具一:  UIDevice
        //UIDevice是ios中用來管理裝置的類別
        //UIDevice.current中會存放現在執行這支程式的裝置資訊(這會是一個UIDevice的物件---由系統產生)
        //UIDevice物件有一個systemVersion(一個字串)，會被系統填入現在這隻硬體的系統資訊
        let systemVersion = UIDevice.current.systemVersion
        print("iOS\(systemVersion)")
        //iPhone or iPad
        let model = UIDevice.current.model
        print("device type=\(model)")
        */
        
        //工具二:  UIScreen
        //UIScreen是ios用來管理螢幕的類別，其main屬性會在程式啟動完成後被系統填入目前視窗的資訊物件
        //在ios中CGRect是一個用來處裡圖形中"矩型"的結構體(CG-> Computer Graphic)
        //只要是有外型的元件，都一定是用一個CGRect物件來表示它的位置(x, y座標)和尺寸(寬width, 高height)
        //下面程式碼取出現在的UIScreen物件(main)後，再取出這個螢幕的CGRect物件(bounds)
        let screenSize: CGRect = UIScreen.main.bounds
        //print(screenSize.size.width)
        
        //程序：
        // 1.有UIWindow物件
        // 2.有控制某頁面(UIView)的控制器(UIViewController)
        // 3.將UIWindow物件裡有一個叫做rootViewController的屬性，這個屬性必須指向
        ///rootViewController是一個視窗顯示後要秀的第一個畫面的控制器
        ///一個頁面的控制器，那麼當視窗初始化後，視窗上面便會出現rootViewController的屬性指向的
        ///那個控制器的畫面
        // 4.將UIWindow物件激活展現
        
        //現在要看條件載入storyboard，上面的流程就得自己做了
        
        
        if screenSize.size.width > 375{
        // 載入i8.storyboard
        //建立UIWindow物件來用(因為我要自己載入storyboard擋，流程自己跑，會無法用到它內部產生的UIWindow)
        // step.1
        window = UIWindow()
        // step.2
        //取的storyboard檔
        //宣告並呼叫UIStoryboard建構子來建立
        //參數一是storyboard檔名，參數二是檔案在哪個開發包(Bundle)中(nil表示用預設值，就"本開發包")
        let i8:UIStoryboard = UIStoryboard(name: "i8", bundle: nil)
        //再由storyboard檔取得要載入的第一個UIView的UIViewController
        let root_controller:ViewController //宣告ViewController變數
        //呼叫UIStoryboard物件的instantiateViewController函數(傳入你要建立的控制器在storyboard上的名字)
        //注意！！instantiateViewController函數回傳的是UIViewController物件，但在此！我是ViewController，所以要轉型
        //同一系列(父子繼承關係)下、是用"正名"轉型  ---> as  加 ! 是因為萬一轉不出來，至少要給個 nil 值
        root_controller = i8.instantiateViewController(withIdentifier: "first") as! ViewController
        // step.3
        window?.rootViewController = root_controller
        // step.4
        window?.makeKeyAndVisible()
        }else{
           
            window = UIWindow()
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "first") as! ViewController
            window?.makeKeyAndVisible()
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

