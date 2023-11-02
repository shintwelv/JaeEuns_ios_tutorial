//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by siheo on 11/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        let exec = UIAlertAction(title: "실행", style: .destructive)
        let stop = UIAlertAction(title: "중지", style: .destructive)
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true)
    }
}

