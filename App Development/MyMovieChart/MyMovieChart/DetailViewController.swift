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
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var mvo:MovieVO!
    
    override func viewDidLoad() {
        NSLog("linkUrl = \(self.mvo.detail!), title\(self.mvo.title!)")
        
        self.wv.navigationDelegate = self
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        let url = URL(string: self.mvo.detail!)
        let req = URLRequest(url: url!)
        
        self.wv.load(req)
    }
}

//MARK: - WKNavigationDelegate
extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        
        self.alert("상세페이지를 읽어오지 못했습니다") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        
        self.alert("상세 페이지를 읽어오지 못했습니다") {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension UIViewController {
    func alert(_ message:String, onClick: (() -> Void)? = nil) -> Void {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            onClick?()
        }))
        DispatchQueue.main.async {
            self.present(controller, animated: true)
        }
    }
}
