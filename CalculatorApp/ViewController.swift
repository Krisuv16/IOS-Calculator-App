//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Krisuv Bohara on 2022-09-21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var viewBorder: [UIView]!
    
    @IBOutlet weak var calWorkings: UILabel!
    @IBOutlet var calBtn: [UIButton]!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for borders in viewBorder{
            borders.layer.borderWidth = 1
            borders.layer.cornerRadius = 32
        }
        for btns in calBtn {
            btns.layer.cornerRadius = 20
        }
        // Do any additional setup after loading the view.
    }
    
    func addValuer (vals : String){
        workings = workings + vals
        calWorkings.text = workings
    }
    func clearValues(){
        workings = ""
        calWorkings.text = ""
        
    }
    
    
    @IBAction func onNumberPressed(_ sender: UIButton) {
        let iden = sender as UIButton
        switch iden.titleLabel!.text {
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
            addValuer(vals: ".")
        case "Clear":
            clearValues()
        default:
            print("asdas")
        }
    }
}

