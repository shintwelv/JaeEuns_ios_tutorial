//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by siheo on 11/1/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBAction func back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func back2(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
