//
//  LoginViewController.swift
//  instagram-parse
//
//  Created by Ebuka Egbunam on 7/10/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLable: UITextField!
    
    @IBOutlet weak var passowrdLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let username = usernameLable.text
        let password = passowrdLabel.text
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user, error) in
            
            if let error = error {
                print(error.localizedDescription)
                fatalError()
            }
            if let user = user {
                print("sucess signin\(String(describing: user.username))")
                 self.performSegue(withIdentifier: "home", sender: nil)
            }
            
        }
        
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameLable.text
        user.password = passowrdLabel.text
        user.signUpInBackground { (sucess, error) in
            
            if let error = error {
                print(error.localizedDescription)
                fatalError()
            }
            if sucess{
                self.performSegue(withIdentifier: "home", sender: nil)
            }

        }

        
        
    }
    

}
