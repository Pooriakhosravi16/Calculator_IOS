//
//  ViewController.swift
//  Calculator
//
//  Created by Pooria Khosravi on 12/3/1403 AP.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var userViewLabel: UILabel!
 
    
    var currentNumber = ""
    var Operator = ""
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var typingFirstNumber : Bool = true
    @IBAction func numberButtons(_ sender: UIButton){
        
            currentNumber += String(sender.tag)
            userViewLabel.text! = currentNumber
            
    }
    
    
    @IBAction func operators(_ sender: UIButton) {
       
        
        Operator = String(sender.titleLabel?.text ?? "")
        
        
        checkOperand()
        currentNumber = ""
        typingFirstNumber = false
        
    }
    
    @IBAction func equalButton(_ sender: Any) {
        checkOperand()
        switch Operator {
            case "+":
                currentNumber = String(firstNumber + secondNumber)
            case "-":
            currentNumber = String (firstNumber - secondNumber)
            case "×":
            currentNumber = String(firstNumber * secondNumber)
            case "÷":
            currentNumber = String(firstNumber / secondNumber)
        case "%":
            currentNumber = String(Int(firstNumber) % Int(secondNumber))
        default:
            break
        }
       
        
        if  Double(currentNumber) != nil {
            firstNumber = Double(currentNumber) ?? 0
        } else {
            currentNumber  = String(currentNumber.dropFirst(2))
            
            firstNumber = Double(currentNumber) ?? 0
        }
        secondNumber = 0
        if firstNumber == floor(firstNumber) {
            userViewLabel.text! = String(Int(firstNumber))
        }else {
            userViewLabel.text! = String(firstNumber)
        }
        
    }
    @IBAction func clearButton(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        Operator = ""
        currentNumber = ""
        userViewLabel.text! = "0"
        typingFirstNumber = true
    }
    
    
    @IBAction func invertSign(_ sender: Any) {
        currentNumber = "-\(currentNumber)"
        
        userViewLabel.text! = currentNumber
    }
    @IBAction func addDecimal(_ sender: Any) {
        currentNumber += "."
        userViewLabel.text! = currentNumber
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func checkOperand(){
        if typingFirstNumber == true {
            firstNumber = Double(currentNumber) ?? 0
            
        }else if typingFirstNumber == false {
            secondNumber = Double(currentNumber) ?? 0
        }
    }
    
    
}

