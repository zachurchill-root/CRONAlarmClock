//
//  EditAlarmViewController.swift
//  CRONAlarmClock
//
//  Created by Zachary Churchill on 10/12/20.
//

import UIKit

class EditAlarmViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var cronInput: UITextField!
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func saveExpression(_ sender: UIButton) {
        if let enteredExpression = cronInput.text {
            if CRONExpression.isValid(for: enteredExpression) {
                let cronExpression = try! CRONExpression.parseExpression(for: enteredExpression)
                alarm.cronExpression = cronExpression
                cronInput.textColor = .light
            } else {
                print("Expression is not valid")
                cronInput.textColor = .red
            }
        }
    }
    
    var alarm: Alarm!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        cronInput.text = alarm.cronExpression.expression
    }
}
