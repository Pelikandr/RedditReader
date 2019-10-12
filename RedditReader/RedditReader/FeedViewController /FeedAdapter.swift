//
//  FeedAdapter.swift
//  RedditReader
//
//  Created by Denis Zayakin on 9/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit
import Alamofire

class FeedAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var data = [FeedItem]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        
        cell.titleLabel.text = item.title
        cell.authorCreatedLabel?.text = item.author
        cell.numCommentsLabel?.text = String(item.commentsNumber)
//        request(item.thumbnail).responseData { response in
//            cell.imageView!.image = UIImage(data: response.data!, scale: 1)
//            print(UIImage(data: response.data!))
//        }
        cell.postImage.image = item.thumbnailImage
        print(item.thumbnailImage)
        //cell.postImage.sizeToFit()
        return cell
    }
    
}
