//
//  PickerViewDataSource.swift
//  many_pages
//
//  Created by KaiChieh on 2018/1/30.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

class PickerViewDataSource: NSObject, UIPickerViewDataSource {
    var JDH = JSONDataHandler()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
//            print("numberOfRowsInComponent_0 = \(JDH.areas.count)")
            if let count = JDH.areas?.count {
                return count
            }
        case 1:
//            print("numberOfRowsInComponent_1 = \(JDH.singers.count)")
            if let count = JDH.singers?.count {
                return count
            }
        case 2:
//            print("numberOfRowsInComponent_2 = \(JDH.songs.count)")
            if let count = JDH.songs?.count {
                return count
            }
        default:
            return 1
        }
        return 1
    }


}
