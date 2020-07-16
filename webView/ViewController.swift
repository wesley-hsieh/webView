//
//  ViewController.swift
//  webView
//
//  Created by Wesley on 6/23/20.
//  Copyright © 2020 Wesley. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate{

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        webView.addSubview(activityInd)
        activityInd.startAnimating()
        webView.navigationDelegate = self
        activityInd.hidesWhenStopped = true
    }
    
    @IBAction func back(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityInd.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityInd.startAnimating()
    }
}

