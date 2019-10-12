//
//  FeedAdapter.swift
//  RedditReader
//
//  Created by Denis Zayakin on 9/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        cell.titleLabel.text = "Artificially grown human organs are seen by many as the \"holy grail\" for resolving organ shortage. A new sacrificial ink-writing technique from Harvard allows 3D printing of large, vascularized human organ building blocks, yielding viable, organ-specific tissues with high cell density and function."
        cell.titleLabel.sizeToFit()
        cell.layer.cornerRadius = 2
        cell.postImage.image = UIImage(named: "sample")
        cell.postImage.sizeToFit()
        cell.layer.cornerRadius = 4
        return cell
    }
    
}
