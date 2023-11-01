//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by siheo on 11/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveByNavi(_ sender: UIBarButtonItem) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: UIButton) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
        self.present(uvc, animated: true)
    }
}

