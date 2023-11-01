//
//  ViewController.swift
//  SubmitValue
//
//  Created by ShinIl Heo on 11/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var intervalText: UILabel!
    @IBOutlet weak var isUpdateText: UILabel!
    @IBOutlet weak var interval: UIStepper!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
        
        rvc.paramEmail = self.emailTextField.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else { return }
        
        rvc.paramEmail = self.emailTextField.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
}

