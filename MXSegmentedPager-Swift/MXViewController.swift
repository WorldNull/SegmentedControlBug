// MXViewController.swift
//
// Copyright (c) 2015 Maxime Epain
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import MXSegmentedPager
import KASlideShow

class MXViewController: MXSegmentedPagerController, KASlideShowDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedPager.backgroundColor = UIColor.whiteColor()
        
        
        // Parallax Header       
        self.segmentedPager.parallaxHeader.view = MXHeaderView.instanceFromNib();
        let headerImageView = self.segmentedPager.parallaxHeader.view?.subviews[0] as! KASlideShow
        headerImageView.delegate = self
        headerImageView.delay = 1
        headerImageView.transitionDuration = 0.5
        headerImageView.transitionType = .Slide
        headerImageView.imagesContentMode = .ScaleAspectFill
        headerImageView.addImagesFromResources(["test_1.jpeg","test_2.jpeg","test_3.jpeg"])
        headerImageView.start()

        
        
        // headerImageView.image = UIImage(named: "success-baby")
        self.segmentedPager.parallaxHeader.mode = MXParallaxHeaderMode.Fill;
        self.segmentedPager.parallaxHeader.height = 370/*370*/;
        self.segmentedPager.parallaxHeader.minimumHeight = 80;
        
    
        // Segmented Control customization
        self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        self.segmentedPager.segmentedControl.backgroundColor = UIColor.whiteColor()
        self.segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()];
        self.segmentedPager.segmentedControl.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 15.0)!]
        self.segmentedPager.segmentedControl.contentHorizontalAlignment = .Center
        self.segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : UIColor.orangeColor()]
        self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe
        self.segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.orangeColor()
        
        execute()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    func execute() {
        let apiKey = NSProcessInfo.processInfo().environment["f5rj7w949s29jfu8c5g7jh4q"]
        let apiSecret = NSProcessInfo.processInfo().environment["rYZK8n9gaaavQHPPqByVVSUawajp6eFN6Z9jAA3z2N6kY"]
        let connectSdks = ConnectSdk(apiKey: apiKey, andApiSecret: apiSecret)
        
        // connectSDK.Search().Images().withPhrase("dog")
        let imagesResponse = connectSdks.Search().Images().withPhrase("dog").Execute()
        print("images: \(imagesResponse)")
        
        
        
    }
    
    override func segmentedPager(segmentedPager: MXSegmentedPager, titleForSectionAtIndex index: Int) -> String {
        return ["About", "Routras", "User Stories"][index];
    }
    /*
    override func segmentedPager(segmentedPager: MXSegmentedPager, didScrollWithParallaxHeader parallaxHeader: MXParallaxHeader) {
        NSLog("progress %f", parallaxHeader.progress)
    }
    */
}
