//
//  AwesomeViewController.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/28/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import WebKit

class AwesomeViewController: UIViewController
{
    
    
    @IBOutlet weak var awesomeWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myUrl = NSURL(string: "https://www.youtube.com/watch?v=StTqXEQ2l-Y")
        let request = NSURLRequest(URL: myUrl!)
        awesomeWebView.loadRequest(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
