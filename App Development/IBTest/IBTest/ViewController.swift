//
//  ViewController.swift
//  IBTest
//
//  Created by siheo on 11/1/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var uiTitle01: UILabel!

    @IBOutlet weak var uiTitle02: UILabel!

    @IBOutlet weak var uiTitle03: UILabel!

    @IBOutlet weak var uiTitle04: UILabel!

    @IBOutlet weak var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "Button01 clicked"
    }

    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "Button02 clicked"
    }

    @IBAction func clickBtn03(_ sender: Any) {
        self.uiTitle03.text = "Button03 clicked"
    }

    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle04.text = "Button04 clicked"
    }

    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "Button05 clicked"
    }
}

