//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by ShinIl Heo on 11/4/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var wv: WKWebView!
    
    var mvo:MovieVO!
    
    override func viewDidLoad() {
        NSLog("linkUrl = \(self.mvo.detail!), title\(self.mvo.title!)")
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        let url = URL(string: self.mvo.detail!)
        let req = URLRequest(url: url!)
        
        self.wv.load(req)
    }
}
