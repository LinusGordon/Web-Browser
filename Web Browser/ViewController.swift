//
//  ViewController.swift
//  Tabs
//
//  Created by Linus Gordon on 12/27/15.
//  Copyright © 2015 Linus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let password = "Guest"
    @IBOutlet var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        self.navigationController!.navigationBarHidden = true;
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toView2(_: AnyObject) {
        let view2 =  self.storyboard?.instantiateViewControllerWithIdentifier("View2") as! ViewController2
        
        if password == passwordTextField.text {
            self.navigationController?.pushViewController(view2, animated: true)
        }
    }
        
    


}
