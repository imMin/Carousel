//
//  PhotoViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/17/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

	@IBOutlet weak var shareOverLayView: UIImageView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		var defaults = NSUserDefaults.standardUserDefaults()
		defaults.setBool(true, forKey: "did_view_photo_full_screen")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressShareButton(sender: AnyObject) {
		
		UIView.animateWithDuration(0.4, animations :{
			self.shareOverLayView.frame.origin.y = 200
		})
	}


	@IBAction func didPressEmailButton(sender: AnyObject) {
		UIView.animateWithDuration(0.4, animations :{
			self.shareOverLayView.frame.origin.y = 568
		})
	}
	
	@IBAction func didPressBackButton(sender: AnyObject) {
		navigationController!.popViewControllerAnimated(true)
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
