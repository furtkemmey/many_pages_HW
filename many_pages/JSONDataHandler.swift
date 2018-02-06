//
//  JSONDataHandler.swift
//  many_pages
//
//  Created by KaiChieh on 2018/1/30.
//  Copyright © 2018年 john. All rights reserved.
//

import UIKit

class JSONDataHandler: NSObject {
    var areas: [String]? = [String]()
    var singers: [String]? = [String]()
    var songs: [String]? = [String]()
    override init() {
        super.init()
        self.getArea()
        if let areaArray = areas {
            self.fillUpSisngers(country: areaArray[0])
        }
        if let singerArray = singers {
            self.fillUpSongs(singer: singerArray[0])
        }

    }
    func getArea() {
        let pathToJson = Bundle.main.path(forResource: "songData", ofType: "json")!
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: pathToJson))
            let jsonDicObj = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String : Any]// Any to dictionary
            let xxx: [[String : Any]] = jsonDicObj["areas"] as! [[String : Any]]// array of dictionary
            for temp: [String : Any] in xxx {// to list this array
                areas?.append(temp["area"]! as! String)
            }
        } catch {
            print("read error is \(error)")
        }
        
    }
    func fillUpSisngers(country: String) {
        let pathToJson = Bundle.main.path(forResource: "songData", ofType: "json")!
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: pathToJson))
            let jsonDicObj = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String : Any]// Any to dictionary
            if let arrayOfDictionary = jsonDicObj["areas"] as? [[String : Any]] {// array of dictionary
                for temp in arrayOfDictionary {// to list this array
                    if temp["area"] as? String == country {
                        singers = temp["singer"] as? [String]
                    }
                }
            }
        } catch {
            print("read error is \(error)")
        }
//        return singers
    }

    func fillUpSongs(singer: String?) {
        let pathToJson = Bundle.main.path(forResource: "songData", ofType: "json")!
        songs = []
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: pathToJson))
            let jsonDicObj = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String : Any]
            if let aDictionarySongList: [String : String] = jsonDicObj[singer!] as? [String : String] {
                for temp  in aDictionarySongList.values {
//                    print("Songs list is \(temp)")
                    songs?.append(temp)
                }
            }
        } catch {
            print("read error is \(error)")
        }
//        return songs

    }


    /// This is an awesome documentation line for a really *useful* variable.
    var someVar = "This is a variable"
    /**
     It calculates and returns the outcome of the division of the two parameters.

     ## Important Notes ##
     1. Both parameters are **double** numbers.
     2. For a proper result the second parameter *must be other than 0*.
     3. If the second parameter is 0 then the function will return nil.

     */

    func performDivision(number1: Double, number2: Double) -> Double! {
        if number2 != 0 {
            return number1 / number2
        }
        else {
            return nil
        }
    }
}
