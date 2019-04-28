//
//  VladimirViewController.swift
//  project_3
//
//  Created by fibe on 28/04/2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import UIKit

class VladimirViewController: UIViewController {
    
    var red: Float = 0.76 {
        didSet {
            redLabel.text = String(format: "%.2f", red)
            redSlider.value = red
            redTextField.text = String(format: "%.2f", red)
            colorView.backgroundColor = viewColor
        }
    }
    var green: Float = 0.76 {
        didSet {
            greenLabel.text = String(format: "%.2f", green)
            greenSlider.value = green
            greenTextField.text = String(format: "%.2f", green)
            colorView.backgroundColor = viewColor
        }
    }
    var blue: Float = 0.76 {
        didSet {
            blueLabel.text = String(format: "%.2f", blue)
            blueSlider.value = blue
            blueTextField.text = String(format: "%.2f", blue)
            colorView.backgroundColor = viewColor
        }
    }
    var viewColor: UIColor {
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    //MARK: Properties
    //
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var resetButton: UIButton!
    //MARK: Actions
    @IBAction func resetAction(_ sender: UIButton) {
        view.endEditing(true)
        red = 0
        green = 0
        blue = 0
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        view.endEditing(true)
        switch sender.tag {
        case 0: red = sender.value
        case 1: green = sender.value
        case 2: blue = sender.value
        default: break
        }
    }
    
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let string = textField.text {
            if let number = Float(string) {
                if (0 <= number) && (number <= 1) {
                    switch textField.tag {
                    case 0: red = number
                    case 1: green = number
                    case 2: blue = number
                    default: break
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redSlider.tintColor = UIColor.red
        greenSlider.tintColor = UIColor.green
        blueSlider.tintColor = UIColor.blue
        
        colorView.backgroundColor = viewColor
        //        colorView.layer.cornerRadius = 20
        
        resetButton.layer.cornerRadius = 5
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.white.cgColor
        
        red = 0
        green = 1
        blue = 0
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

