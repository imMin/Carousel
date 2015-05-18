//
//  emailWrittenViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/17/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class emailWrittenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@IBAction func didPressDoneButton(sender: AnyObject) {
		
		var defaults = NSUserDefaults.standardUserDefaults()
		defaults.setBool(true, forKey: "did_share_photo")

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
