//
//  ViewController.swift
//  PlusMinus
//
//  Created by user928865 on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var valueLabel: UILabel!
    
    var value: Int = 0
    @IBAction func updateLabel(_ sender: UIButton){
        
        
        if sender == plusButton{
            value+=1
        }else{
            value-=1
        }
        
        if value >= 0{
            valueLabel.textColor=UIColor.label;
        }else{
            valueLabel.textColor=UIColor.systemRed;
        }
        
        if value == 0{
            valueLabel.text = "zero"
        }else{
            valueLabel.text = String(value)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = "zero"
    }
    
}

