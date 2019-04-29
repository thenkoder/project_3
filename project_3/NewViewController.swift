//
//  NewViewController.swift
//  project_3
//
//  Created by fibe on 29/04/2019.
//  Copyright © 2019 Другов Родион. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redTextField: UITextField!
    
    // MARK: Actions
    @IBAction func changeSliderValue(_ sender: UISlider) {
        redLabel.text = floatToString(argument: sender.value)
    }
    
    // MARK: То что написал

    func floatToString(argument: Float) -> String {
        return String(format: "%.2f", argument)
    }
    // MARK: То что получил
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        redLabel.text = textField.text
    }
}
