//
//  APIManager.swift
//  RedditReader
//
//  Created by Maria Holubieva on 08.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    //var onRecieve: (([FeedItem]?) -> Void)?
    let dataParser = DataParser()

    func getFeedData(completion: ((_ data: [FeedItem]?, _ error: Error?) -> Void)?) {
        var feedItems: [FeedItem]?
        request("https://www.reddit.com/top.json").validate().responseJSON { responseJson in
            switch responseJson.result {
            case .success(let value):
                feedItems = self.dataParser.parse(value)
            case .failure(let error):
                print(error)
            }
            completion!(feedItems, nil)
        }
    }

}
