//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by siheo on 11/1/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
