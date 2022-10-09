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
    
    @IBOutlet var viewBorder: [UIView]!
    
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
        return lhs + rhs
    }
    
    func subtractOperation(lhs: Float, rhs:Float)->Float
    {
        return lhs - rhs
    }
    
    func multiplyOperation(lhs: Float, rhs:Float)->Float
    {
        return lhs * rhs
    }
    
    func divideOperation(lhs: Float, rhs:Float)->Float
    {
        return lhs * rhs
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
    
    @IBAction func operatorPressed(_ sender: UIButton )
    {
        let button = sender as UIButton
        let currentInput = button.titleLabel!.text
        let resultLabelText = calWorkings.text
        
        if(!haveLeftOperand)
        {
            haveLeftOperand = true
            leftOperand = Float(resultLabelText!)!
            resultLabelReady = false
        }
        else
        {
            rightOperand = Float(resultLabelText!)!
            haveRightOperand = true
        }
        
        if(haveLeftOperand && haveRightOperand)
        {
            Evaluate()
            leftOperand = result
            rightOperand = 0.0
            resultLabelReady = false
        }
        
        switch currentInput
        {
        case "+":
            activeOperator = "+"
        case "-":
            activeOperator = "-"
        case "X":
            activeOperator = "X"
        case "/":
            activeOperator = "/"
        case "=":
            Evaluate()
        default:
            print("")
        }
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
    
    var leftOp = ""
    var rightOp = ""
    
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
                }else{
                    leftOp = resultLabelText
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
                addValuer(vals: "%")
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
    
}

