//
//  TweetDetailsViewController.swift
//  Pods
//
//  Created by twen6 on 2/27/16.
//
//

import UIKit

class TweetDetailsViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    
    var tweet: Tweet!
    var rt = false
    var l = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(tweet.name)
        
        nameLabel.text = tweet.name as? String
        usernameLabel.text = "@\(tweet.username!)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        timeLabel.text = dateFormatter.stringFromDate(tweet!.timestamp!)
        
        textLabel.text = tweet.text as? String
        
        retweetLabel.text = "\(tweet!.retweetCount)"
        likeLabel.text = "\(tweet!.favoritesCount)"
        
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
    

    @IBAction func onRetweet(sender: AnyObject) {
        if rt {
            tweet.retweetCount--
            
        } else {
            tweet.retweetCount++
            
        }
        rt = !rt
        retweetLabel.text = "\(tweet!.retweetCount)"
    }
    
    @IBAction func onLike(sender: AnyObject) {
        if l {
            tweet.favoritesCount--
            
        } else {
            tweet.favoritesCount++
            
        }
        l = !l
        likeLabel.text = "\(tweet!.favoritesCount)"
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dViewController = segue.destinationViewController as! profileViewController
        
        dViewController.tweet = tweet
    }
    

}
