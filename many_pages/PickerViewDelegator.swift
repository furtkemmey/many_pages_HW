//
//  PickerViewDelegator.swift
//  many_pages
//
//  Created by KaiChieh on 2018/1/30.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

class PickerViewDelegator: NSObject, UIPickerViewDelegate {
    var JDH = JSONDataHandler()

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
//            print("titpleForRow_0\(JDH.areas[row])")
            if let str = JDH.areas?[row] {
                return str
            }
        case 1:
//            print("titpleForRow_1\(JDH.singers[row])")
            if let str = JDH.singers?[row] {
                return str
            }
        case 2:
//            print("titpleForRow_2\(JDH.songs[row])")
            if let count = JDH.songs?.count, count > 0 {// check there are some songs
                if let str = JDH.songs?[row] {
                    return str
                }
            }
        default:
            return "not set"
        }
        return "No Items"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch component {
        case 0:
//            print("didSelectRow_1")
            if let area = JDH.areas?[row] {
                JDH.fillUpSisngers(country: area)
            }
            pickerView.reloadComponent(1)
        case 1:
//            print("didSelectRow_2= \(JDH.singers[row])")
            if let singer = JDH.singers?[row] {
                JDH.fillUpSongs(singer: singer)
            }
            pickerView.reloadComponent(2)
        case 2:
            print("didSelectRow = \(row)")
        default:
            print("country")
        }
    }
}
