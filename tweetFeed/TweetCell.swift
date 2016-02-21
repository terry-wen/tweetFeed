//
//  TweetCell.swift
//  tweetFeed
//
//  Created by twen6 on 2/20/16.
//  Copyright © 2016 twen6. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {

    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var rt = false
    var l = false
    
    var tweet: Tweet! {
        didSet {
            handleLabel.text = "@\(tweet!.username!)"
            nameLabel.text = tweet!.name as? String
            tweetLabel.text = tweet!.text as? String
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            timestampLabel.text = dateFormatter.stringFromDate(tweet!.timestamp!)
            
            retweetLabel.text = "\(tweet!.retweetCount)"
            likeLabel.text = "\(tweet!.favoritesCount)"
            
            if let URLtext = tweet!.profileUrl {
                let imageURL = NSURL(string: (URLtext as String))
                profileImageView.setImageWithURL(imageURL!)
                profileImageView.layer.cornerRadius = 5
                profileImageView.clipsToBounds = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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

}
