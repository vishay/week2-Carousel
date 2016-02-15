//
//  LoginViewController.swift
//  Carousel
//
//  Created by Vishay Nihalani on 2/13/16.
//  Copyright © 2016 Vishay Nihalani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    // Scroll view containing the fields
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    // View with text entry fields
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // View with sign in button and loading widget
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var offsetY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        // Set up notifications for the keyboard show/hide
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        offsetY = -120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTouchUpInsideBackButton(sender: AnyObject) {
        
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in

            let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.offsetY
            self.loginScrollView.contentOffset.y = self.loginScrollView.contentInset.bottom
        })
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY
        })
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y <= -50) {
            
            view.endEditing(true)
        }
    }
    
    @IBAction func didTouchUpInsideSignIn(sender: UIButton) {
        
        if (emailTextField.text!.isEmpty) {
            
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address.", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
            
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else if (passwordTextField.text!.isEmpty) {
            
            let alertController = UIAlertController(title: "Password Required", message: "Please enter your password.", preferredStyle: .Alert)

            let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
            
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else if (emailTextField.text == "Apple" && passwordTextField.text == "apple") {

            activityIndicator.startAnimating()
            
            delay(2, closure: { () -> () in
                
                self.activityIndicator.stopAnimating()
                self.performSegueWithIdentifier("login", sender: self)
            })
        } else {

            activityIndicator.startAnimating()
            
            delay(2, closure: { () -> () in
            
                let alertController = UIAlertController(title: "Incorrect login", message: "Your email and password combination is incorrect.", preferredStyle: .Alert)
            
                let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
            
                alertController.addAction(okAction)
                
                self.activityIndicator.stopAnimating()
                self.presentViewController(alertController, animated: true, completion: nil)
            })
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
