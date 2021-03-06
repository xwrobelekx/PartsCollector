//
//  CreatePartViewController.swift
//  PartsCollector
//
//  Created by Kamil Wrobel on 2/27/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class CreatePartViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addupdateButton: UIButton!
    
    
    
    var imagePicker44 = UIImagePickerController()
    //this is a new propert called imagePicker which alows us to select picture form users library or take a new picture
    
    
    var part: Parts? = nil
    // the purpose of this property is to see if were gone create new object (object = nil), or if we coming in with existing object
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker44.delegate = self
        // when object is using a delegate, its pulling an required informations it needs to get set up.
        // imagePicker44. delegate = self which means its equal to the class above, and we need to set up the class by adding UIImagePickerControllerDelegate, and UINavigationControllerDelegate
        
        
        if part != nil {
            partImageView.image = UIImage(data: part!.image as! Data)
            titleTextField.text = part!.title
            
            addupdateButton.setTitle("Update", for: .normal)
            print("eeeeeeeeee")
            
        } else {
            deleteButton.isHidden = true
        }
        
    }
    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker44.sourceType = .photoLibrary
        // gets existing photos from device photo Library
        
        present(imagePicker44, animated: true, completion: nil)
        //this shows another ViewController
        
    }
    
    
    // this is where we get information on what image was selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image3 = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        partImageView.image = image3
        // this takes a selected image and shows it in the image view in our app
        
        imagePicker44.dismiss(animated: true, completion: nil)
        // this dissmises the pick image view
        
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
         if part != nil {
            
            part!.title = titleTextField.text
            // asigns text from text field to part property
            part!.image = UIImagePNGRepresentation(partImageView.image!) as NSData?
            // assigns image from imageView to part property
            
         } else {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // creates context
        let part = Parts(context: context)
        // new property of type Parts
        part.title = titleTextField.text
        // asigns text from text field to part property
        part.image = UIImagePNGRepresentation(partImageView.image!) as NSData?
        // assigns image from imageView to part property
            
         }
            
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // saves the context in Core Data
        
        navigationController!.popViewController(animated: true)
        
        
        
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(part!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // saves the context in Core Data
        
        navigationController!.popViewController(animated: true)

        
        
    }
}
