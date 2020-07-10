//
//  PostsViewController.swift
//  instagram-parse
//
//  Created by Ebuka Egbunam on 7/10/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit
import Parse


struct Post{
    
    var comment : String
    var authur : PFUser
    var imageurl : String?
    
    init(comment : String , authur : PFUser , imageData : PFFileObject) {
        self.comment = comment
        self.authur = authur
        self.imageurl = imageData.url
    }
}

class PostsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var posts : [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadPosts()
    }
    
    
    func loadPosts() -> Void {
        posts.removeAll()
        let query = PFQuery(className: "Posts")
        query.limit = 20
        query.includeKey("auhtor")
        query.findObjectsInBackground { (objects, error) in
            if let error = error{
                fatalError(error.localizedDescription)
            }
            guard let objets = objects else {return}
            
            for object in objets {
                
                let comment = object["comment"] as! String
                let user = object["author"] as! PFUser
                let data = object["imageData"] as! PFFileObject
                
                let post = Post(comment: comment, authur: user, imageData: data)
                self.posts.append(post)
                
                
            }
            self.tableView.reloadData()
        }
        
    }
    

}


extension PostsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PostsTableViewCell {
            cell.post = posts[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
