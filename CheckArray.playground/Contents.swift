import UIKit

let arr1 = ["менеджер", "По", "продажаМ"]
let arr2 = ["Региональный менеджер по продажам", "Менеджер по продажам автомобилей", "Менеджер по продажам", "Менеджер по продажам", "Менеджер по продажам", "Менеджер по продаам", "Региональный менеджер по продажам (Запад)", "Менеджер по развитию продаж", "Менеджер по продажам"]
let lowerArr1 = arr1.map { $0.lowercased() }
var lowerArr2 = arr2.map { $0.lowercased() }
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
            print(i)
        }
        if j == lowerArr1.count - 1 {
            x = lowerArr1.count
        }
        }
}

//for i in 0...lowerArr2.count - 1 {
//    let string = lowerArr2[i].components(separatedBy: .whitespaces)
//    nestedArray.append(string)
//}
//var x = lowerArr1.count
//for i in 0...nestedArray.count - 1 {
//    for j in 0...nestedArray[i].count - 1 {
//        for k in 0...lowerArr1.count - 1 {
//            if nestedArray[i][j] == lowerArr1[k] {
//                x -= 1
//            }
//        }
//        if j == nestedArray[i].count - 1 && x != 0 {
//            print(i)
//        }
//        if j == nestedArray[i].count - 1 {
//            x = lowerArr1.count
//        }
//    }
//}

