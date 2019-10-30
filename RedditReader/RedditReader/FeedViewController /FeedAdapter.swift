//
//  FeedAdapter.swift
//  RedditReader
//
//  Created by Denis Zayakin on 9/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

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
        cell.postImage.sd_setImage(with: URL(string: item.thumbnail), placeholderImage: UIImage(named: "sample"))
        return cell
    }
    
}
