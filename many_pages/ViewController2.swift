//
//  ViewController2.swift
//  many_pages
//
//  Created by 梁老師 on 2018/1/22.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var songList: UIPickerView!
    var pickerVewDelegatory: PickerViewDelegator?
    @IBOutlet var pickerViewDataSource: PickerViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerVewDelegatory = PickerViewDelegator()
        songList.delegate = pickerVewDelegatory
        songList.dataSource = pickerViewDataSource

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
