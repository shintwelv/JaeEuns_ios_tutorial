//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by ShinIl Heo on 11/1/23.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    
    override func perform() {
        let srcUVC: UIViewController = self.source
        
        let destUVC: UIViewController = self.destination
        
        // 컨트롤러에 있는 뷰만 읽어와 전환하는 세그웨이
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
