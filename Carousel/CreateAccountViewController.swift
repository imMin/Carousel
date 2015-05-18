//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/16/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
	@IBOutlet weak var firstNameField: UITextField!
	@IBOutlet weak var lastNameField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passWordField: UITextField!
	@IBOutlet weak var createAccountFormView: UIView!
	@IBOutlet weak var termCheckmarkView: UIView!
	@IBOutlet weak var createAccountButton: UIImageView!
	@IBOutlet weak var createAccountButtonView: UIView!
	
	@IBOutlet weak var checkBox: UIButton!
	var createAccountFormViewCenterOrigin : CGFloat = 0.0
	
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
			if (self.createAccountFormView.center.y == self.createAccountFormViewCenterOrigin - 135) {
				
				self.createAccountFormView.center.y += 135
				self.termCheckmarkView.center.y += 167
				self.createAccountButtonView.center.y+=193
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
			if (self.createAccountFormView.center.y == self.createAccountFormViewCenterOrigin){
				self.createAccountFormView.center.y -= 135
				self.termCheckmarkView.center.y -= 167
				self.createAccountButtonView.center.y-=193
			}
			// Set view properties in here that you want to match with the animation of the keyboard
			// If you need it, you can use the kbSize property above to get the keyboard width and height.
			}, completion: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		createAccountFormViewCenterOrigin = createAccountFormView.center.y
		
		//counter to keep track of times cliked on checkbox
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func checkBoxSelected(sender: UIButton) {
		if (sender.selected == false){
			sender.selected = true
		}
		else{
			sender.selected = false
		}
	
	}
	
	
	@IBAction func didPressBackButton(sender: AnyObject) {
		navigationController!.popViewControllerAnimated(true)
	}
	
	
	@IBAction func didPressCreateAccountButton(sender: AnyObject) {
			if firstNameField.text.isEmpty {
				var alertView = UIAlertView(title: "First Name Required", message: "Please enter your first name", delegate: nil, cancelButtonTitle: "OK")
				alertView.show()
			}
			else if lastNameField.text.isEmpty{
				var alertView = UIAlertView(title: "Last Name Required", message: "Please enter your last name", delegate: nil, cancelButtonTitle: "OK")
				alertView.show()
			}
			else if emailField.text.isEmpty{
				var alertView = UIAlertView(title: "Email Required", message: "Please enter your email", delegate: nil, cancelButtonTitle: "OK")
				alertView.show()
			}
			else if passWordField.text.isEmpty{
				var alertView = UIAlertView(title: "Password Required", message: "Please enter a password", delegate: nil, cancelButtonTitle: "OK")
				alertView.show()
			}
			else if checkBox.selected == false {
				var alertView = UIAlertView(title: "Please Agree to Terms", message: "Please read and agree to our terms", delegate: nil, cancelButtonTitle: "OK")
				alertView.show()
			}
			else {
	
//				delay(, { () -> () in
				self.performSegueWithIdentifier("createAccountSegue", sender:nil)
//				})
			}
		
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
