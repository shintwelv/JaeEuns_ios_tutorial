//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by siheo on 11/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wind(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
}

