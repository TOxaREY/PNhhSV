//
//  CutArray.swift
//  PNhhSV
//
//  Created by REYNIKOV ANTON on 03.11.2019.
//  Copyright © 2019 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class CutArray {
    
    func cutArray(arrayName: Array<String>, arrayFull: Array<NameAndEmpolyer>, viewModel: ViewModel) -> [NameAndEmpolyer] {
        if arrayName.count != 0 && arrayFull.count != 0  {
            var arr = [String]()
            for i in 0...arrayFull.count - 1 {
                arr.append(arrayFull[i].name)
            }
            let arr1 = arrayName
            let arr2 = arr
            var arrNumberForRemove = [Int]()
            var arrFull = arrayFull
            var arrayFinish = [NameAndEmpolyer]()
            let lowerArr1 = arr1.map { $0.lowercased() }
            let lowerArr2 = arr2.map { $0.lowercased() }
            var stringArray = [String]()
            for i in 0...lowerArr2.count - 1 {
                let str = lowerArr2[i]
                let arr = str.components(separatedBy: .whitespaces)
                let string = arr.joined()
                stringArray.append(string)
            }
            var x = lowerArr1.count
            for i in 0...stringArray.count - 1 {
                for j in 0...lowerArr1.count - 1 {
                    if stringArray[i].contains(lowerArr1[j]) {
                        x -= 1
                    }
                    if j == lowerArr1.count - 1 && x != 0 {
                        arrNumberForRemove.append(i)
                    }
                    if j == lowerArr1.count - 1 {
                        x = lowerArr1.count
                    }
                }
            }
            if arrNumberForRemove.count != 0 {
                for i in 0...arrNumberForRemove.count - 1 {
                    arrFull[arrNumberForRemove[i]].name = ""
                }
                arrayFinish = arrFull.filter{ $0.name != "" }
            } else {
                arrayFinish = arrFull
            }
            if arrayFinish.count != 0 {
                for i in 0...arrayFinish.count - 1 {
                    viewModel.id.append(arrayFinish[i].id)
                }
                return arrayFinish
            }
        }
        return arrayFull
    }
}
