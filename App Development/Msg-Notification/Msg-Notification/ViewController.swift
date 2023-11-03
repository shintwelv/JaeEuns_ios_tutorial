//
//  ViewController.swift
//  Msg-Notification
//
//  Created by ShinIl Heo on 11/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBAction func save(_ sender: Any) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    let nContent = UNMutableNotificationContent()
                    nContent.body = (self.msg.text)!
                    nContent.title = "미리 알림"
                    nContent.sound = .default
                    
                    let time = self.datePicker.date.timeIntervalSinceNow
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                    
                    UNUserNotificationCenter.current().add(request) { (_) in
                        DispatchQueue.main.async {
                            let date = self.datePicker.date.addingTimeInterval(9*60*60) // Korea GMT+9
                            let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다"
                            
                            let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                            
                            let ok = UIAlertAction(title: "확인", style: .default)
                            alert.addAction(ok)
                            
                            self.present(alert, animated: false)
                        }
                    }
                }
            } else {
                let alert = UIAlertController(title: "알림등록", message: "알림이 허용되어 있지 않습니다", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "확인", style: .default)
                alert.addAction(ok)
                
                self.present(alert, animated: true)
                return
            }
        }
    }
    
}

