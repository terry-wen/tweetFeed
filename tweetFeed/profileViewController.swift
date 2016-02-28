//
//  profileViewController.swift
//  Pods
//
//  Created by twen6 on 2/27/16.
//
//

import UIKit

class profileViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var tweet: Tweet!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet]!
    
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

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        TwitterClient.sharedInstance.userTimeline((tweet.username as? String)!, success: { (tweets: [Tweet]) -> () in
            self.tweets = tweets
            
            self.tableView.reloadData()
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets.count
        } else {
            return 0
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
