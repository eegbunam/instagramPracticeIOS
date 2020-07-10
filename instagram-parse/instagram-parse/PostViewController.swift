//
//  PostViewController.swift
//  instagram-parse
//
//  Created by Ebuka Egbunam on 7/10/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class PostViewController: UIViewController {
    
    
    @IBOutlet weak var CameraimageView: UIImageView!
    
    
    @IBOutlet weak var comment: UITextField!
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openCamera))
    override func viewDidLoad() {
        super.viewDidLoad()
        CameraimageView.isUserInteractionEnabled = true
        CameraimageView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @objc func openCamera(){
        print("tapping")
        let pickerView = UIImagePickerController()
        pickerView.delegate = self
        pickerView.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            pickerView.sourceType = .camera
        }else{
            pickerView.sourceType = .photoLibrary
        }
        present(pickerView, animated: true, completion: nil)
        
    }
    
    
    @IBAction func OpenCamera(_ sender: Any) {
        print("tapping")
        
    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
        if !comment.text!.isEmpty{
            guard  let imageData = CameraimageView.image?.pngData() else {return}
            guard let fileObject = PFFileObject(data: imageData) else {return}
            
            let object = PFObject(className: "Posts", dictionary: ["author":PFUser.current()! , "comment" : comment.text! , "imageData" : fileObject])
            
            object.saveInBackground { (sucess, error) in
                
                if let error = error {
                    print("There was an error saving posts" , error.localizedDescription)
                }
                if sucess{
                    self.navigationController?.popViewController(animated: true)
                }

            }
        }
        
        
        
        
    }
    
}


extension PostViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        CameraimageView.image = image
        dismiss(animated: true, completion: nil)
    }
}
