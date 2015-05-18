//
//  IntroViewController.swift
//  Carousel
//
//  Created by Min Hu on 5/14/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {


	@IBOutlet weak var tile1View: UIImageView!
	
	@IBOutlet weak var tile2View: UIImageView!
	
	@IBOutlet weak var tile3View: UIImageView!
	
	@IBOutlet weak var tile4View: UIImageView!
	
	@IBOutlet weak var tile5View: UIImageView!
	
	@IBOutlet weak var tile6View: UIImageView!
	
	
	var tileViews : [UIImageView] = []
	var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
	var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
	var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
	var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
	
	func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float{
		var ratio = (r2Max - r2Min)/(r1Max - r1Min)
		return value * ratio + r2Min - r1Min * ratio
	}
//	
//	func transformView(view : UIView!, atIndex index : Int, offset : Float){
//		
//	}
//	
//	func updateViewTransformsWithOffset(offset : Float){
//		
//	}
	
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet weak var imageView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view = scrollView
        scrollView.contentSize = imageView.image!.size
		scrollView.delegate = self
		
		
		scrollView.sendSubviewToBack(imageView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func scrollViewDidScroll(scrollView: UIScrollView){
		var offset = Float(scrollView.contentOffset.y)
		
//		println("content offset: \(scrollView.contentOffset.y)")
		//content offset: 0-> 568
		//x offset: -30->0
		//y offset: -285->0
		
//		var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
//		
//		var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
//		
//		var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
//		
//		var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
//		
//		tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
//		tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
//		tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI/180))
		
		func tileViewTransform(tileView: UIImageView, xinitial: Float, yinitial: Float, scaleInital: Float, rotationInitial: Float){
			var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xinitial, r2Max: 0)
			
			var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yinitial, r2Max: 0)
			
			var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scaleInital, r2Max: 1)
			
			var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotationInitial, r2Max: 0)
			
			tileView.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
			tileView.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
			tileView.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI/180))
		}
		
		
		tileViews = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
		
		for (var i = 0; i < 6; i++){
			tileViewTransform(tileViews[i], xOffsets[i], yOffsets[i], scales[i], rotations[i])
		}
		
	}
    
	@IBAction func buttonTapped(sender: AnyObject) {
		print("hello")
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
