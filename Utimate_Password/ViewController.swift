//
//  ViewController.swift
//  Utimate_Password
//
//  Created by MouseMaster on 2017/6/19.
//  Copyright © 2017年 Toby Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var label47: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var guessCount: UILabel!
    @IBOutlet weak var reDoBu: UIButton!
    
    var answer = Int(arc4random_uniform(100) + 0)
    var low:Int = 0
    var high:Int = 100
    var count = 0

    @IBAction func reDoBu(_ sender: Any) {
        low = 0
        high = 100
        count = 0
        guessCount.text = "目前總共猜了第\(count)次"
        numTextField.text = nil
        label47.text = ""
        label47.textColor = UIColor.black
        answer = Int(arc4random_uniform(100) + 0)
        numTextField.placeholder = "0 ~ 100"
        reDoBu.isHidden = true
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        
        print("\(answer)")
        count = count + 1
        guessCount.text = "目前總共猜了第\(count)次"
        let a = Int(numTextField.text!)
    
       
        if  a != nil && a! >= low && a! <= high {
            if a! == answer{
                label47.text = "中標了!請接受懲罰~"
                label47.textColor = UIColor.purple
                reDoBu.isHidden = false
            } else if a! < answer{
                low = a!
                label47.text = "數字介於\(low)和\(high)之間"
                label47.textColor = UIColor.blue
                numTextField.text = nil
                numTextField.placeholder = "\(low) ~ \(high)"
            } else if a! > answer{
                high = a!
                label47.text = "數字介於\(low)和\(high)之間"
                label47.textColor = UIColor.blue
                numTextField.text = nil
                numTextField.placeholder = "\(low) ~ \(high)"
            }
        
        } else if a == nil{
             label47.text = "請麻煩輸入整數,再按『確定』按鈕"
             label47.textColor = UIColor.red
             guessCount.text = "目前總共猜了第0次"
            
        } else{
            label47.text = "請輸入\(low)～\(high)之間的數字,您不識字嗎？"
            numTextField.text = nil
            label47.textColor = UIColor.red
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:UIEvent?){
      numTextField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numTextField.font = UIFont(name: "Helvetica Neue", size: 30)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

