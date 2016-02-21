//
//  LoginViewController.swift
//  tweetFeed
//
//  Created by twen6 on 2/20/16.
//  Copyright © 2016 twen6. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    @IBAction func onLoginButton(sender: AnyObject) {
        let twitterClient = TwitterClient.sharedInstance
        
        twitterClient.login({ () -> () in
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            }) { (error: NSError!) -> () in
                print("Error: \(error.localizedDescription)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
