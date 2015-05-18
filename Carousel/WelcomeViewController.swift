//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/16/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var pageControl: UIPageControl!
	
	@IBOutlet weak var spinButton: UIImageView!
	
	@IBOutlet weak var takeForASpinButton: UIButton!
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		//Set content size of the scroll view
		
		scrollView.contentSize = CGSize(width: 1280, height: 568)
		
		scrollView.delegate = self
		
		//Disable the take for a spin button
		
		takeForASpinButton.enabled = false

		
    }
	
	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		//Get the current page based on the scroll offset
		var page : Int = Int(round(scrollView.contentOffset.x/320))
		
		//Set the current page, so the dots will update
		pageControl.currentPage = page
		
		if (page == 3){
		//show image for the spin button on page 3
			spinButton.alpha = 1
		//Enable the spin button
			takeForASpinButton.enabled = true
		}
			
		//on any other page, the take for a spin button would be disabled
			
		else {
			spinButton.alpha = 0
			takeForASpinButton.enabled = false
		}
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
