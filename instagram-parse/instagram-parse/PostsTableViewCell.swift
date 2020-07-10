//
//  PostsTableViewCell.swift
//  instagram-parse
//
//  Created by Ebuka Egbunam on 7/10/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class PostsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var imagePosted: UIImageView!
    
    var post : Post! {
        didSet{
            comment.text = post.comment
            if let url = post.imageurl{
                imagePosted.af.setImage(withURL: URL(string: url)!)
            }
        }
    }

}
