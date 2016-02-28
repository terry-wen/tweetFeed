//
//  Tweet.swift
//  tweetFeed
//
//  Created by twen6 on 2/20/16.
//  Copyright © 2016 twen6. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var username: NSString?
    var name: NSString?
    var text: NSString?
    var profileUrl: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var tweetsCount: Int = 0
    var followersCount: Int = 0
    var followingCount: Int = 0
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        let timestampString = dictionary["created_at"] as? String
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let user = dictionary["user"] as! NSDictionary
        
        name = user["name"] as? String
        username = user["screen_name"] as? String
        
        profileUrl = user["profile_image_url_https"] as? String
        
        tweetsCount = (user["statuses_count"] as? Int) ?? 0
        followersCount = (user["followers_count"] as? Int) ?? 0
        followingCount = (user["friends_count"] as? Int) ?? 0
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}
