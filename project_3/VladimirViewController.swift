//
//  VladimirViewController.swift
//  project_3
//
//  Created by fibe on 28/04/2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import UIKit

class VladimirViewController: UIViewController {
    
    var redFloat: CGFloat = 0.0
    var greenFloat: CGFloat = 1.0
    var blueFloat: CGFloat = 0.0
    
    private var red: Float = 0.76 {
        didSet {
            redLabel.text = String(format: "%.2f", red)
            redSlider.value = red
            redTextField.text = String(format: "%.2f", red)
            colorView.backgroundColor = viewColor
        }
    }
    private var green: Float = 0.76 {
        didSet {
            greenLabel.text = String(format: "%.2f", green)
            greenSlider.value = green
            greenTextField.text = String(format: "%.2f", green)
            colorView.backgroundColor = viewColor
        }
    }
    private var blue: Float = 0.76 {
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
    
//    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let string = textField.text, let number = Float(string), (0 <= number) && (number <= 1) {
            switch textField.tag {
            case 0: red = number
            case 1: green = number
            case 2: blue = number
            default: break
            }
        } else {
            showAlert(title: "Что то не так", message: "Число должно быть от нуля до единицы")
            switch textField.tag {
            case 0: redTextField.text = String(format: "%.2f", red)
            case 1: greenTextField.text = String(format: "%.2f", green)
            case 2: blueTextField.text = String(format: "%.2f", blue)
            default: break
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
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
        
        red = Float(redFloat)
        green = Float(greenFloat)
        blue = Float(blueFloat)
        
        addDoneButtonTo(redTextField)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
                
    }
    // Метод для отображения кнопки "Готово" на цифровой клавиатуре
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - self.view.frame.height + resetButton.frame.origin.y + resetButton.frame.height + 10
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

