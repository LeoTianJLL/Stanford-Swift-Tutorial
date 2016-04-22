//
//  ViewController.swift
//  Calculator
//
//  Created by Leo.Tian on 14/4/2016.
//  Copyright © 2016 Leo.Tian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!

    var userIsInTheMiddleOfTypeingANumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        
        if userIsInTheMiddleOfTypeingANumber {
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypeingANumber = true
        }
            
    }
    
    @IBAction func enter() {
        
        userIsInTheMiddleOfTypeingANumber = false
        
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
        
        
    }
    
    @IBAction func operate(sender: UIButton) {
        
        if userIsInTheMiddleOfTypeingANumber {
            enter()
        }
        
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation){
                displayValue = result
            }else{
                displayValue = 0
            }
        }
       
        
    }
    
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            
        }
    }
}

