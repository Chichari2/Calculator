//
//  ViewController.swift
//  Taschenrechner
//
//  Created by Артем Вологдин on 23.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0
    var firstNum:Double = 0
    var operation:Int = 0
    var mathSign:Bool = false
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true{
            result.text = String(sender.tag)
            mathSign = false
        }else{
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15{
            firstNum = Double(result.text!)!
            
            if sender.tag == 11{
               result.text = "/"
            }
            else if sender.tag == 12{
               result.text = "x"
            }
            else if sender.tag == 13{
               result.text = "-"
            }
            else if sender.tag == 14{
               result.text = "+"
            }
            else if sender.tag == 16{
                if result.text != "0" && result.text != "0.0"{
                    if firstNum.truncatingRemainder(dividingBy: 1) == 0{
                result.text = String(format: "%.0f", -firstNum)
                    }else{result.text = String(-firstNum)
                    }
                }
            }
            
            else if sender.tag == 17{
               result.text = "%"
            }


            operation = sender.tag
            mathSign = true
            
        }
        else if sender.tag == 15{
            if operation == 11{
            if (firstNum/numberFromScreen).truncatingRemainder(dividingBy: 1) == 0{
                result.text = String(format: "%.0f", firstNum/numberFromScreen)
                }else{result.text = String(firstNum/numberFromScreen)}
            }
            
            if operation == 12{
                if (firstNum*numberFromScreen).truncatingRemainder(dividingBy: 1) == 0{
                    result.text = String(format: "%.0f", firstNum*numberFromScreen)
                    }else{result.text = String(firstNum*numberFromScreen)}
                }
            
            if operation == 13{
                if (firstNum-numberFromScreen).truncatingRemainder(dividingBy: 1) == 0{
                    result.text = String(format: "%.0f", firstNum-numberFromScreen)
                    }else{result.text = String(firstNum-numberFromScreen)}
                }
            
            if operation == 14{
                if (firstNum+numberFromScreen).truncatingRemainder(dividingBy: 1) == 0{
                    result.text = String(format: "%.0f", firstNum+numberFromScreen)
                    }else{result.text = String(firstNum+numberFromScreen)}
                }
            
            if operation == 17{
                if (firstNum.truncatingRemainder(dividingBy: numberFromScreen)).truncatingRemainder(dividingBy: 1) == 0{
                    result.text = String(format:"%.0f", firstNum.truncatingRemainder(dividingBy: numberFromScreen))
                }else{result.text = String(firstNum.truncatingRemainder(dividingBy: numberFromScreen))
                }
        }
        }
        else if sender.tag == 10{
            result.text = ""
            operation = 0
            firstNum = 0
            numberFromScreen = 0
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}


