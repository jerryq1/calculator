//
//  Reckon.swift
//  calculator
//
//  Created by jerry on 16/7/14.
//  Copyright © 2016年 jerry. All rights reserved.
//

import Foundation

struct Rec {
    
    //设置当前算法为未选择
    var CurrentAlgorithm:Algorithm = .noChoice
    
    //设置枚举：算法，包含加减乘除，平方，指数幂，未选择
    enum Algorithm{
        case addition
        case subtraction
        case multiplication
        case division
        case square
        case exponential
        case noChoice
    }
    
    //设置方法：设当前算法
    mutating func setCurrentAlgorithm(Algorithm1:Algorithm){
        CurrentAlgorithm = Algorithm1
    }
    
    //设置方法：得当前算法
    func getCurrentAlgorithm()->Algorithm{
        return CurrentAlgorithm
    }
    
    //设置方法：得到结果
    func getTheResult(number1:Double,number2:Double)->String{
        var result = ""
        switch CurrentAlgorithm{
        case .addition:
            result = "\(number1+number2)"
        case .subtraction:
            result = "\(number1-number2)"
        case .multiplication:
            result = "\(number1*number2)"
        case .division where number2 != 0 :
            //这里的意思是当被除数不等于0的时候执行
            result = "\(number1/number2)"
        case .square:
            result = "\(number1*number1)"
        case .exponential:
            var lin = number1
            let intNumber2 = Int(number2)
            //将被除数的double类型转化为整数类型作为幂函数
            for _ in 1..<intNumber2{
                lin *= number1
            }
            result = "\(lin)"
        case .noChoice:
            print("你还没有选择算法，请选择算法")
        default:
            print("0不能作为被除数")
        }
        return result
    }
}