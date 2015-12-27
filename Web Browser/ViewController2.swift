//
//  ViewController2.swift
//  Tabs
//
//  Created by Linus Gordon on 12/27/15.
//  Copyright © 2015 Linus. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var webView : UIWebView!
    @IBOutlet var urlBar: UITextField!
    @IBOutlet var goButton : UIButton!
    @IBOutlet var backButton : UIButton!
    @IBOutlet var forwardButton: UIButton!
    
    var lastPage : String!
    var nextPage : String!
    var currentPage : String!
    var defaultWebpage = "https://www.google.com"
    
    override func viewDidLoad() {
        self.navigationController!.navigationBarHidden = true;
        self.navigationController!.toolbarHidden = false;
        self.urlBar.delegate = self
        lastPage = defaultWebpage
        currentPage = defaultWebpage
        let url = NSURL(string:defaultWebpage)
        let req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req) //Loads the webpage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePage(_: AnyObject)
        
    {
        lastPage = currentPage
        if urlBar.text!.hasPrefix("https://") {
            urlBar.text = urlBar.text!
        }
        else {
            urlBar.text = "https://" + urlBar.text!
        }
        currentPage = urlBar.text
        
        let url = NSURL(string:urlBar.text!)
        let req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
        self.view.endEditing(true)
    }
    
    @IBAction func goBack(_: AnyObject)
    {
        let url = NSURL(string:lastPage)
        let req = NSURLRequest(URL: url!)
        self.webView!.loadRequest(req)
        nextPage = urlBar.text
        urlBar.text = lastPage
    }
    
    @IBAction func goForward(_: AnyObject)
    {
        if nextPage != nil
        {
            let url = NSURL(string:nextPage!)
            let req = NSURLRequest(URL: url!)
            self.webView!.loadRequest(req)
            lastPage = urlBar.text
            urlBar.text = nextPage
        }
        
    }
    
    // Hides the keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true);
        
        return false;
        
    }
}
