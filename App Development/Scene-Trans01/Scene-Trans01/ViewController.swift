//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by siheo on 11/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveNext(_ sender: UIButton) {
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
            uvc.modalTransitionStyle = .coverVertical
            
            self.present(uvc, animated: true)
        }
        
    }
}

