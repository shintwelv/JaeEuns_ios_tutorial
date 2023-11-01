//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by ShinIl Heo on 11/1/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = self.paramUpdate ? "자동갱신" : "자동갱신안함"
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
