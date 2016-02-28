//
//  profileViewController.swift
//  Pods
//
//  Created by twen6 on 2/27/16.
//
//

import UIKit

class profileViewController: UIViewController {

    var tweet: Tweet!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = tweet.username as? String
        nameLabel.text = tweet.name as? String
        
        followersLabel.text = "\(tweet.followersCount)"
        followingLabel.text = "\(tweet.followingCount)"
        tweetLabel.text = "\(tweet.tweetsCount)"
        
        if let URLtext = tweet!.profileUrl {
            let imageURL = NSURL(string: (URLtext as String))
            profileImageView.setImageWithURL(imageURL!)
            profileImageView.layer.cornerRadius = 5
            profileImageView.clipsToBounds = true
        }

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
