//
//  GetStartedViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/17/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

	@IBOutlet weak var firstCheckBoxButton: UIButton!
	
	@IBOutlet weak var secondCheckBoxButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		var defaults = NSUserDefaults.standardUserDefaults()
		var firstCheckBox = defaults.boolForKey("did_view_photo_full_screen")
		
		if (firstCheckBox == true){
			
			firstCheckBoxButton.selected = true
		}
		
		var secondCheckBox = defaults.boolForKey("did_share_photo")
		
		if (secondCheckBox == true){
			secondCheckBoxButton.selected = true
		}
		
		

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
