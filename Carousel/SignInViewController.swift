//
//  SignInViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/16/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

	@IBOutlet weak var emailField: UITextField!
	
	@IBOutlet weak var passWordField: UITextField!
	
	@IBOutlet weak var logInView: UIView!
	
	@IBOutlet weak var logInButtonView: UIView!
	
	@IBOutlet weak var loadingBoxView: UIView!
	
	@IBOutlet weak var signingInField: UITextField!
	
	
	@IBOutlet weak var scrollView: UIScrollView!
	
	
	var logInViewCenterOrigin : CGFloat = 0.0
	
	var keyboardShown : Bool = false
	
	
	func keyboardWillHide(notification: NSNotification!) {
		var userInfo = notification.userInfo!
		
		// Get the keyboard height and width from the notification
		// Size varies depending on OS, language, orientation
		var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
		var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
		var animationDuration = durationValue.doubleValue
		var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
		var animationCurve = curveValue.integerValue
		
		UIView.animateWithDuration(0.4, delay: 0.0, options: nil, animations: {
			
			if (self.keyboardShown) {
				self.keyboardShown = false
				
//				print (self.scrollView.frame.height)
				// change scroll view size back up
				self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y, self.scrollView.frame.width, self.scrollView.frame.height + kbSize.height)
				self.scrollView.contentSize = CGSize(width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.height + 150)
				
//				print(self.scrollView.frame)
				
//				self.scrollView.frame.height = self.scrollView.frame.height + CGFloat(200)
				self.scrollView.contentOffset = CGPointMake(0, 0)
//				self.logInView.center.y += 80
				self.logInButtonView.center.y += 140
			}
			
			// Set view properties in here that you want to match with the animation of the keyboard
			// If you need it, you can use the kbSize property above to get the keyboard width and height.
			}, completion: nil)
	}
 
	func keyboardWillShow(notification: NSNotification!) {
		var userInfo = notification.userInfo!
		
		// Get the keyboard height and width from the notification
		// Size varies depending on OS, language, orientation
		var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
		var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
		var animationDuration = durationValue.doubleValue
		var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
		var animationCurve = curveValue.integerValue
		
		UIView.animateWithDuration(0.4, delay: 0.0, options: nil, animations: {
			
			if (!self.keyboardShown){
				self.keyboardShown = true
				
//				print (self.scrollView.frame.height)
				// change scroll view size and scroll view content size to smaller
				self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y, self.scrollView.frame.width, self.scrollView.frame.height - kbSize.height)
				self.scrollView.contentSize = CGSize(width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.height - 150)
				
//				print(self.scrollView.frame)
//				print(self.scrollView.contentSize)
				
//				self.scrollView.frame.height -= 200

				self.scrollView.contentOffset = CGPointMake(0, 80)
				self.logInButtonView.center.y -= 140
//				self.logInView.center.y -= 80
//				self.logInButtonView.center.y -= kbSize.height - 30
			}
			// Set view properties in here that you want to match with the animation of the keyboard
			// If you need it, you can use the kbSize property above to get the keyboard width and height.
			}, completion: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
		//initiate scroll view content size
		scrollView.contentSize = CGSize(width: 320, height: 568)
//		
//		var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
//		
//		scrollView.addGestureRecognizer(panGestureRecognizer)
		
//		emailFieldOriginy = emailField.y
		
//		print(fadeInView.frame)
		//initialize fadeInView opacity to 0, and set size to 0.1
		logInView.alpha = 0
		logInView.transform = CGAffineTransformMakeScale(0.1, 0.1)
		
		//animate fade in and scale up effect
		UIView.animateWithDuration(0.6, animations: {
			self.logInView.alpha = 1
			self.logInView.transform = CGAffineTransformMakeScale(1, 1)
			})

		
		
//		fadeInView.sizeThatFits(<,#size: CGSize#>) = 0.1
		
//		fadeInView.animateWithDuration(0.2, animations:{() -> Void in
//			
//			})
		
		logInViewCenterOrigin = logInView.center.y
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
		
		loadingBoxView.alpha = 0
		signingInField.alpha = 0

        // Do any additional setup after loading the view.
		
		//detect if LoginFields position is lower than orignial position

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressSignInButton(sender: AnyObject) {
		if emailField.text.isEmpty {
			var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "OK")
			alertView.show()
		}
		else if passWordField.text.isEmpty{
			var alertView = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: nil, cancelButtonTitle: "OK")
			alertView.show()
		}
		else {
			UIView.animateWithDuration(0.4, animations: {
    // Fade in the loading view
				self.loadingBoxView.alpha = 0.8
				self.signingInField.alpha = 1
			})
			
			delay(2, { () -> () in
				if self.emailField.text == "tim@thecodepath.com" && self.passWordField.text == "password" {
					self.performSegueWithIdentifier("signinSegue", sender:nil)
				}
				else {
					var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "OK")
					alertView.show()
				}
				self.loadingBoxView.alpha = 0
				self.signingInField.alpha = 0
			})
			
			
		}
		
		var defaults = NSUserDefaults.standardUserDefaults()
		defaults.setBool(false, forKey: "did_view_photo_full_screen")
		defaults.setBool(false, forKey: "did_share_photo")
		defaults.setBool(false, forKey: "did_swipe_photo")
		
	}
		
//	func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
//		var point = panGestureRecognizer.locationInView(scrollView)
//		var velocity = panGestureRecognizer.velocityInView(scrollView)
//		if panGestureRecognizer.state == UIGestureRecognizerState.Began {
//			println("Gesture began at: \(point)")
//		} else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
//			println("Gesture changed at: \(point)")
//		} else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
//			println("Gesture ended at: \(point)")
//		}
//	}
//	

	
	
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
