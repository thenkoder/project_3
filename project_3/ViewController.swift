//
//  ViewController.swift
//  project_3
//
//  Created by Другов Родион on 31/03/2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var red : CGFloat = 0.00
    private var green : CGFloat = 0.00
    private var blue : CGFloat = 0.00
    
//    private var redNumb = String(Float(0.00))
    private var redNumb = "0.00"
    private var greenNumb = String(Float(0.00))
    private var blueNumb = String(Float(0.00))
    
    private var backgroundColors = UIColor()
    
    private var myTextField = UITextField()
    var textFields = ["firstTextField", "secondTextField", "thirdTextField"]
    
    
    
    @IBOutlet weak var viewInPhone: UIView!
    
    @IBOutlet weak var redNumbers: UILabel!
    @IBOutlet weak var greenNumbers: UILabel!
    @IBOutlet weak var blueNumbers: UILabel!
    
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTextField.delegate = self
        
        viewInPhone.layer.cornerRadius =  viewInPhone.frame.width / 12
        
        redSliderOutlet.tintColor = .red
        redNumbers.text = redNumb
        
        greenSliderOutlet.tintColor = .green
        greenNumbers.text = greenNumb
        
        blueSliderOutlet.tintColor = .blue
        blueNumbers.text = blueNumb
        
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if myTextField == firstTextField {
            self.myTextField.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func redSlider(_ sender: UISlider) {
        redNumbers.text = upDateString(string: sender.value)
        changeColor()
        red = CGFloat(sender.value)
        
        viewInPhone.backgroundColor = backgroundColors
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        greenNumbers.text = upDateString(string: sender.value)
        changeColor()
        green = CGFloat(sender.value)
        
        viewInPhone.backgroundColor = backgroundColors
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        blueNumbers.text = upDateString(string: sender.value)
        changeColor()
        blue = CGFloat(sender.value)
        
        viewInPhone.backgroundColor = backgroundColors
    }
    
    @IBAction func firstActionTF(_ sender: UITextField) {
        
        guard firstTextField.text?.isEmpty == false
            else {return}
        
        if let someFloat = Float(firstTextField.text!){
            redSliderOutlet.setValue(someFloat, animated: true)
        }
        
        firstTextField.text = nil
        
        redNumbers.text = firstTextField.text
        
    }
    @IBAction func secondActionTF(_ sender: UITextField) {
        
        guard secondTextField.text?.isEmpty == false
            else {return}
        
        if let someFloat = Float(secondTextField.text!){
            greenSliderOutlet.setValue(someFloat, animated: true)
        }
        
        secondTextField.text = nil
        
        greenNumbers.text = secondTextField.text
        
    }
    @IBAction func thirdActionTF(_ sender: UITextField) {
        
        guard thirdTextField.text?.isEmpty == false
            else {return}
        
        if let someFloat = Float(thirdTextField.text!){
            blueSliderOutlet.setValue(someFloat, animated: true)
        }
        
        //        thirdTextField.text = nil
        
        blueNumbers.text = thirdTextField.text
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    public func changeColor() {
        backgroundColors = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    func upDateString (string:Float) -> String {
        let strings = String(format: "%.2f", string)
        return strings
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowVladimir" {
            
                let detailsVC = segue.destination as! VladimirViewController
                detailsVC.redFloat = red
                detailsVC.greenFloat = green
                detailsVC.blueFloat = blue
        }
    }
    
}

extension UIViewController: UITextFieldDelegate{
    
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

