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

let apiManager = APIManager()

class DataParser {
    var feedItems = [FeedItem]()
    //var thumb: UIImage?

    func parse(_ value: Any) -> [FeedItem]? {
        var thumb: UIImage?
        let data = JSON(value)
        for item in data["data"]["children"].arrayValue {
            thumb = nil
            guard let title = item["data"]["title"].string,
                let author = item["data"]["author"].string,
                let createdDate = item["data"]["created"].float,
                let commentsNumber =  item["data"]["num_comments"].int,
                let thumbnail = item["data"]["thumbnail"].string else {return nil}
            //print("THUMBNAIL \n \(thumbnail) \n ---------------------------------------------------------------")
            request(thumbnail).responseData { response in
                thumb = UIImage(data: response.data!)
            }
            let feedItem = FeedItem(title: title, author: author, createdDate: createdDate, commentsNumber: commentsNumber, thumbnail: thumbnail, thumbnailImage: UIImage(named: "sample"))
            feedItems.append(feedItem)
            
            //            apiManager.getThumbnail(url: thumbnail) { (image: UIImage?, error: Error?) in
            //
            //                if let error = error {
            //                    print("ERROR: \(error.localizedDescription)")
            //                } else if let tempImage = image {
            //                    self.thumb = tempImage
            ////                    thumbImage = tempImage
            ////                    print(thumbImage)
            //
            //                } else {
            //                    print("ERROR: Unknown")
            //                }
            //            }
            
        }
        return feedItems
    }
    
}
