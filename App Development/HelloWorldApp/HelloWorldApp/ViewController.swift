//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by siheo on 11/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTitle: UILabel! // 아울렛 변수
    
    override func viewDidLoad() {
        /*
         뷰의 로딩이 완료되었을 때 시스템에 호출되는 콜백(Callback) 메소드
         리소스를 초기화 하거나 초기 화면을 구성하는 등 처음 한번만 실행해야 하는 초기화 코드를 주로 작성
         */
        super.viewDidLoad()
    }


    @IBAction func sayHello(_ sender: UIButton) {
        self.uiTitle.text = "Hello, World!"
    }
}

