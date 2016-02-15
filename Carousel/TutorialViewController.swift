//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Vishay Nihalani on 2/13/16.
//  Copyright © 2016 Vishay Nihalani. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: 4 * 320, height: 568)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tutorialPageControl.alpha = 1
        startButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // Get the current page based on the scroll offset
        let page: Int = Int(round(scrollView.contentOffset.x / 320))

        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page
        
        if (page == 3) {

            self.tutorialPageControl.alpha = 0
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.startButton.alpha = 1
            })
        } else {

            self.tutorialPageControl.alpha = 1
            self.startButton.alpha = 0
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
