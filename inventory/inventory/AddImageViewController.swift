//
//  AddImageViewController.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/8/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // MARK: Developer Defined Variables
    
    @IBOutlet weak var AddImageField: UIImageView!
    
    // MARK: Developer Defined Override Functions
    
    @IBAction func PhotoLibraryImageButton(sender: AnyObject) {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        if(UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)){
            imagePicker.allowsEditing = false;
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        //presentViewController(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func CameraImageButton(sender: AnyObject) {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){
            imagePicker.allowsEditing = false;
            presentViewController(imagePicker, animated: true, completion: nil);
        }
        //presentViewController(imagePicker, animated: true, completion: nil);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UIImageControllerDelegate methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage]{
            AddImageField.image = image as? UIImage;
            self.dismissViewControllerAnimated(true, completion: nil);
        }
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveSelectedImage"){
            let image = segue.destinationViewController as! AddNewItemViewController;
            image.imageField.image = AddImageField.image;
        }
    }
}







