//
//  WebViewViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/16/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {
	@IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let requestURL = NSURL(string: "https://www.dropbox.com/terms?mobile=1")
		
		let request = NSURLRequest(URL: requestURL!)
		webView.loadRequest(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressDoneButton(sender: AnyObject) {
		
		dismissViewControllerAnimated(true, completion: nil)
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
