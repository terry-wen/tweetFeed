//
//  ComposeViewController.swift
//  tweetFeed
//
//  Created by twen6 on 2/27/16.
//  Copyright © 2016 twen6. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let curr = User.currentUser {
            usernameLabel.text = "@\(curr.screenname!)"
            nameLabel.text = curr.name as? String
            profileImageView.setImageWithURL((curr.profileURL)!)
        }
        
        textField.layer.borderWidth = 1.0;
        textField.layer.borderColor = UIColor.grayColor().CGColor
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTweet(sender: AnyObject) {
        TwitterClient.sharedInstance.postTweet(textField.text, success: { () -> () in
            print("successfully tweeted")
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
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
