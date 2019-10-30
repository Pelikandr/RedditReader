//
//  JSONParser.swift
//  RedditReader
//
//  Created by Denis Zayakin on 10/12/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class DataParser {
    var feedItems = [FeedItem]()

    func parse(_ value: Any) -> [FeedItem]? {
        let data = JSON(value)
        for item in data["data"]["children"].arrayValue {
            guard let title = item["data"]["title"].string,
                let author = item["data"]["author"].string,
                let createdDate = item["data"]["created"].float,
                let commentsNumber =  item["data"]["num_comments"].int,
                let thumbnail = item["data"]["thumbnail"].string else {return nil}
            let feedItem = FeedItem(title: title, author: author, createdDate: createdDate, commentsNumber: commentsNumber, thumbnail: thumbnail)
            feedItems.append(feedItem)
        }
        return feedItems
    }
    
}
