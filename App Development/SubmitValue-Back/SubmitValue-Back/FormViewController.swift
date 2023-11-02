//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by siheo on 11/2/23.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value

        self.presentingViewController?.dismiss(animated: true)
    }
}
