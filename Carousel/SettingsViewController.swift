//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/16/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var settingImage: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		scrollView.contentSize = settingImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressBackButton(sender: AnyObject) {
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
