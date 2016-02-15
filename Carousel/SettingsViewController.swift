//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Vishay Nihalani on 2/14/16.
//  Copyright © 2016 Vishay Nihalani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingsScrollView.contentSize = settingsImageView.frame.size
    }

    @IBAction func didTouchUpInsideBackButton(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTouchUpInsideSignOutButton(sender: UIButton) {
        
        let signOutController = UIAlertController(title: "Sign out", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign out", style: .Destructive, handler: { (action) in
         
            self.performSegueWithIdentifier("logout", sender: nil)
        })
        signOutController.addAction(signOutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
        }
        signOutController.addAction(cancelAction)
        
        presentViewController(signOutController, animated: true, completion: nil)
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
