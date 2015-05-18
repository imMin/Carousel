//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/16/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var feedImage: UIImageView!
	
	@IBOutlet weak var bannerView: UIImageView!
	
	@IBOutlet weak var feedView: UIImageView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		scrollView.contentSize = CGSize(width: feedImage.frame.width, height: feedImage.frame.height + 44)
		

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@IBAction func didPressCancelButton(sender: AnyObject) {
		bannerView.alpha = 0
		feedView.frame.origin.y -= 20
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


