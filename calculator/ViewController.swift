//
//  ViewController.swift
//  calculator
//
//  Created by jerry on 16/7/14.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var reckon = Rec()
    //初始化Rec结构
    
    var 显示缓存 = ""
    var 缓存1 = 0.0
    var 缓存2:Double?
    @IBOutlet weak var display: UITextField!
    
    @IBAction func number9(sender: AnyObject) {
        点按("9")
    }
    
    @IBAction func number8(sender: AnyObject) {
        点按("8")
    }
    
    @IBAction func number7(sender: AnyObject) {
        点按("7")
    }
    
    @IBAction func number6(sender: AnyObject) {
        点按("6")
    }
    
    @IBAction func number5(sender: AnyObject) {
        点按("5")
    }
    
    @IBAction func number4(sender: AnyObject) {
        点按("4")
    }
    
    @IBAction func number3(sender: AnyObject) {
        点按("3")
    }
    
    @IBAction func number2(sender: AnyObject) {
        点按("2")
    }
    
    @IBAction func number1(sender: AnyObject) {
        点按("1")
    }
    
    @IBAction func number0(sender: AnyObject) {
        点按("0")
    }
    
    @IBAction func dian(sender: AnyObject) {
        点按(".")
    }

    @IBAction func equal(sender: AnyObject) {
        evalutation()
        reckon.setCurrentAlgorithm(.noChoice)
    }
    
    @IBAction func addition(sender: AnyObject) {
        reckon.setCurrentAlgorithm(.addition)
        evalutation()
    }

    @IBAction func subtraction(sender: AnyObject) {reckon.setCurrentAlgorithm(.subtraction)
        evalutation()
    }
    
    @IBAction func multiplication(sender: AnyObject) {reckon.setCurrentAlgorithm(.multiplication)
        evalutation()
    }
    
    @IBAction func division(sender: AnyObject) {
        reckon.setCurrentAlgorithm(.division)
        evalutation()
    }
 
    @IBAction func square(sender: AnyObject) {
        reckon.setCurrentAlgorithm(.square)
        evalutation()
    }
    
    @IBAction func exponential(sender: AnyObject) {
        reckon.setCurrentAlgorithm(.exponential)
        evalutation()
    }
    
    
    @IBAction func Resetcurrent(sender: AnyObject) {
        显示缓存 = ""
        display.text = ""
    }
    
    @IBAction func ResetAll(sender: AnyObject) {
        显示缓存 = ""
        缓存1 = 0.0
        缓存2 = nil
        reckon.setCurrentAlgorithm(.noChoice)
        display.text = ""
    }
    
    
    func 点按(number:String){
        显示缓存 += number
        display.text = 显示缓存
    }
    
    
    func evalutation(){
        var result = ""
        if !显示缓存 .isEmpty{
            //如果显示缓存不为空就执行
            let lin = 显示缓存 as NSString
            缓存1 = lin.doubleValue
            //将显示缓存的字符串转化为双精度的数字
            显示缓存 = ""
        }
        let 后一个数字 = 缓存1
        if let 前一个数字 = 缓存2{
            result = reckon.getTheResult(前一个数字, number2: 后一个数字)
            display.text = result
            let lin1 = result as NSString
            缓存2 = lin1.doubleValue
        }else{
            缓存2 = 缓存1
            缓存1 = 0.0
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

