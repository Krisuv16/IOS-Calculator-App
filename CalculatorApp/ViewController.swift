/*
 File Name: ViewController
 Author: Krisuv Bohara(301274636), Niraj Nepal(301211100)
 Date: 2022-09-21
 Description: Creates the main UI for the Calculator App
 Version: 1.0
 */

import UIKit

class ViewController: UIViewController {
    var leftOperand: Float = 0.0
    var rightOperand: Float = 0.0
    var haveLeftOperand: Bool = false
    var haveRightOperand: Bool = false
    var resultLabelReady: Bool = true
    var result: Float = 0.0
    var activeOperator: String = ""
    var workings: String = ""
    var workingsDel : String = ""
    var leftOp = ""
    var rightOp = ""
    
    @IBOutlet var viewBorder: [UIView]!
    
    @IBOutlet weak var finalResult: UILabel!
    @IBOutlet weak var calWorkings: UILabel!
    @IBOutlet var calBtn: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for borders in viewBorder{
            borders.layer.borderWidth = 1
            borders.layer.cornerRadius = 32
        }
        for btns in calBtn {
            btns.layer.cornerRadius = 20
        }
    }
    
    
    func addOperation(lhs: Float, rhs:Float)->Float
    {
        var addValue = lhs + rhs
        var stringValue : String = "\(addValue)"
        workings = ""
        calWorkings.text = ""
        addValuer(vals: stringValue)
        finalResult.text = stringValue
        leftOp = ""
        rightOp = ""
        leftOperand = 0.0
        rightOperand = 0.0
        return addValue
    }
    
    func subtractOperation(lhs: Float, rhs:Float)->Float
    {
        var subValue = lhs - rhs
        var stringValue : String = "\(subValue)"
        workings = ""
        calWorkings.text = ""
        addValuer(vals: stringValue)
        finalResult.text = stringValue
        leftOp = ""
        rightOp = ""
        leftOperand = 0.0
        rightOperand = 0.0
        return subValue
    }
    
    func multiplyOperation(lhs: Float, rhs:Float)->Float
    {
        var mulValue = lhs * rhs
        var stringValue : String = "\(mulValue)"
        workings = ""
        calWorkings.text = ""
        addValuer(vals: stringValue)
        finalResult.text = stringValue
        leftOp = ""
        rightOp = ""
        leftOperand = 0.0
        rightOperand = 0.0
        return mulValue
    }
    
    func divideOperation(lhs: Float, rhs:Float)->Float
    {
        var divideValue = lhs / rhs
        var stringValue : String = "\(divideValue)"
        workings = ""
        calWorkings.text = ""
        addValuer(vals: stringValue)
        finalResult.text = stringValue
        leftOp = ""
        rightOp = ""
        leftOperand = 0.0
        rightOperand = 0.0
        return divideValue
    }
    
    func percentageOperation(operands: Float)->Float
    {
        var percentageValue = operands / 100
        var stringValue: String = "\(percentageValue)"
        workings = ""
        calWorkings.text = ""
        addValuer(vals: stringValue)
        finalResult.text = stringValue
        leftOp = ""
        rightOp = ""
        leftOperand = 0.0
        rightOperand = 0.0
        return percentageValue
        
    }
    
    func Evaluate()
    {
        switch activeOperator
        {
        case "+":
            result = addOperation(lhs: leftOperand, rhs: rightOperand)
        case "-":
            result = subtractOperation(lhs: leftOperand, rhs: rightOperand)
        case "X":
            result = multiplyOperation(lhs: leftOperand, rhs: rightOperand)
        case "/":
            result = divideOperation(lhs: leftOperand, rhs: rightOperand)
        default:
            result = 0.0
        }
        
        print(result)
    }
    
    
    func addValuer (vals : String){

        if(workings.count <= 19)
        {
            workings = workings + vals
            calWorkings.text = workings
        }
    }
    
    func clearValues(){
        workings = ""
        calWorkings.text = ""
    }
    
    
    @IBAction func onNumberPressed(_ sender: UIButton) {
        let button = sender as UIButton
        let currentInput = button.titleLabel!.text
        let resultLabelText = calWorkings.text
        switch currentInput
        {
        case "0":
                addValuer(vals: "0")
        case "1":
                addValuer(vals: "1")
        case "2":
                addValuer(vals: "2")
        case "3":
                addValuer(vals: "3")
        case "4":
                addValuer(vals: "4")
        case "5":
                addValuer(vals: "5")
        case "6":
                addValuer(vals: "6")
        case "7":
                addValuer(vals: "7")
        case "8":
                addValuer(vals: "8")
        case "9":
                addValuer(vals: "9")
        case ".":
            if(resultLabelText != ".")
            {
                addValuer(vals: ".")
            }
        case "Clear":
            clearValues()
        default:
            print("")
        }
    }
    

    
    @IBAction func onAddBtnPressed(_ sender: UIButton) {

        let resultLabelText = workings
        if(resultLabelText != "+")
        {
            if(resultLabelText.last! == "+"){

            }else
            {
                addValuer(vals: "+")

                if(leftOp != ""){
                    rightOp = (resultLabelText.components(separatedBy: "+").last!)
                    rightOperand = Float(rightOp)!
                }else{
                    leftOp = resultLabelText
                    leftOperand = Float(leftOp)!
                }
                
                if(rightOperand != 0.0 && leftOperand != 0.0){
                 addOperation(lhs: leftOperand, rhs: rightOperand)
                }
            }
        }
    }
    
    @IBAction func onMinusBtnPressed(_ sender: UIButton) {
        let resultLabelText = calWorkings.text
        if(resultLabelText != "-")
        {
            if(resultLabelText?.last! == "-"){
                
            }else
            {
                addValuer(vals: "-")
                
                if(leftOp != ""){
                    rightOp = (resultLabelText!.components(separatedBy: "-").last!)
                    rightOperand = Float(rightOp)!
                }else{
                    leftOp = resultLabelText!
                    leftOperand = Float(leftOp)!
                }
                
                if(rightOperand != 0.0 && leftOperand != 0.0){
                 subtractOperation(lhs: leftOperand, rhs: rightOperand)
                }
            }
        }
    }
    
    
    @IBAction func onMultiplyBtnPressed(_ sender: UIButton) {
        let resultLabelText = calWorkings.text
        if(resultLabelText != "*")
        {
            if(resultLabelText?.last! == "*"){
                
            }else
            {
                addValuer(vals: "*")
                
                if(leftOp != ""){
                    rightOp = (resultLabelText!.components(separatedBy: "*").last!)
                    rightOperand = Float(rightOp)!
                }else{
                    leftOp = resultLabelText!
                    leftOperand = Float(leftOp)!
                }
                
                if(rightOperand != 0.0 && leftOperand != 0.0){
                 multiplyOperation(lhs: leftOperand, rhs: rightOperand)
                }
            }
        }
    }
    
    @IBAction func onDivideBtnPressed(_ sender: UIButton) {
        let resultLabelText = calWorkings.text
        if(resultLabelText != "÷")
        {
            if(resultLabelText?.last == "÷"){
            }else
            {
                addValuer(vals: "÷")
                
                if(leftOp != ""){
                    rightOp = (resultLabelText!.components(separatedBy: "÷").last!)
                    rightOperand = Float(rightOp)!
                }else{
                    leftOp = resultLabelText!
                    leftOperand = Float(leftOp)!
                }
                
                if(rightOperand != 0.0 && leftOperand != 0.0){
                    divideOperation(lhs: leftOperand, rhs: rightOperand)
                }
            }
        }
    }
    
    @IBAction func onPercentBtnPressed(_ sender: UIButton) {
        let resultLabelText = calWorkings.text
        if(resultLabelText != "%")
        {
            if(resultLabelText?.last! == "%"){
                
            }else
            {
                leftOp = resultLabelText!
                leftOperand = Float(leftOp)!
                
                if(leftOperand != 0.0){
                    percentageOperation(operands: leftOperand)
                }
                
            }
        }
    }
    
    @IBAction func onBackBtnPressed(_ sender: UIButton)
    {
        if(!workings.isEmpty){
            workings.removeLast()
            calWorkings.text?.removeLast()
        }
    }
    //    && resultLabelText?.last! == "÷" && resultLabelText?.last! == "*" && resultLabelText?.last! == "+" && resultLabelText?.last == "-"
    
    
    @IBAction func onEqualBtnPressed(_ sender: UIButton) {
        Evaluate()
    }
    
    @IBAction func onToggleBtnPressed(_ sender: UIButton) {
        if(calWorkings.text != "0" && calWorkings.text != ""){
            if(!calWorkings.text!.contains("-")){
                calWorkings.text!.insert("-", at: calWorkings.text!.startIndex)
            }else{
                calWorkings.text!.remove(at: calWorkings.text!.startIndex)
            }
        }
    }
}

