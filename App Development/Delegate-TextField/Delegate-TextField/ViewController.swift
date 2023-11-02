//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by ShinIl Heo on 11/2/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tf: UITextField!

    override func viewDidLoad() {
        self.tf.placeholder = "값을 입력하세요"
        self.tf.keyboardType = .alphabet
        self.tf.keyboardAppearance = .dark
        self.tf.returnKeyType = .join
        self.tf.enablesReturnKeyAutomatically = true
        
        // styles
        self.tf.borderStyle = .line
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        self.tf.contentVerticalAlignment = .center
        self.tf.contentHorizontalAlignment = .center
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        self.tf.layer.borderWidth = 2.0
        
        // 텍스트 필드를 최초 응답자(first responder)로 지정
        self.tf.becomeFirstResponder()
        
        // delegate 지정
        self.tf.delegate = self
    }
    
    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // 텍스트필드의 편집을 시작할 때 호출
        print("텍스트필드의 편집이 시작됩니다.")
        return true // false를 반환하면 편집이 되지 않는다
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작되었습니다")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍트스 필드의 내용이 삭제됩니다")
        return true //false를 반환하면 삭제되지 않는다
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트필드의 내용이 \(string)으로 변경됩니다")
        if Int(string) == nil {
            if (textField.text?.count)! + string.count > 10 {
                return false // 내용 변경 불가
            } else {
                return true // 내용 변경 허용
            }
        } else {
            return false // 내용 변경 불가
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("텍스트필드의 리턴키가 눌렸습니다")
        return true // false를 반환하면 리턴키가 눌리지 않는다
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트필드의 편집이 종료됩니다")
        return true // false를 반환하면 편집이 종료되지 않는다
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드의 편집이 종료되었습니다")
    }
    
}

