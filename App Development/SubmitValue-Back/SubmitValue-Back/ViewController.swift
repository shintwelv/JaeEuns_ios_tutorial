//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by siheo on 11/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    // 화면이 표시될 때마다 실행이 되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail {
            resultEmail.text = email
        }
        
        if let update = paramUpdate {
            resultUpdate.text = update ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramInterval {
            resultInterval.text = "\(interval)분마다"
        }
    }
}

