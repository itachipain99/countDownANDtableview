//
//  ViewController.swift
//  CountDown
//
//  Created by Nguyễn Minh Hiếu on 1/8/20.
//  Copyright © 2020 Nguyễn Minh Hiếu. All rights reserved.
//

import UIKit
import BackgroundTasks

var count:Int = 100
var countbtn : Bool = true
var time = Timer()
var boolBTN = false
class ViewController: UIViewController{

    
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblSend: UILabel!
    

    
    @objc func  countdown(){
        if count > 0{
            count -= 1
            lblCount.text =  "\(count)"
            countbtn = false
        }
        else{
            lblSend.text = ""
            lblCount.text = ""
            countbtn = true
        }
    }
    func displayCount(){
        time.invalidate()
        time = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func btn_SendOTP(_ sender: Any) {
        boolBTN = true
        if countbtn == false {}
        else{
            count = 100
            lblSend.text = "Gửi lại mã OTP"
            displayCount()
        }
    }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}


