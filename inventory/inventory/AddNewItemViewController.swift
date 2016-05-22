//
//  AddNewItemViewController.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/7/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit



class AddNewItemViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // MARK: UI Variables and Functions
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var availabilityField: UILabel!
    @IBOutlet weak var imageField: UIImageView!

    // MARK: Object Variables
    
    var item:Item?;
    
    var availability:String = "Out of Stock"{
        didSet{
            availabilityField.text? = availability;
        }
    }
    
    var tempImage:UIImage!
    
    // MARK: Developer Override Functions
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0){
            nameField.becomeFirstResponder();
        }
        if(indexPath.section == 1){
            typeField.becomeFirstResponder();
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveItem"){
            item = Item(withName: nameField.text!, itemType: typeField.text!, itemAvailability: availabilityField.text!, itemImage: tempImage)
        }
    }
    
    // MARK: Default Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //imagePicker.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    @IBAction func unwindWithSelectedAvailability(segue: UIStoryboardSegue){
        if let AvailabilityPickerTableViewController = segue.sourceViewController as? AvailabilityPickerTableViewController,
            selectedAvailability = AvailabilityPickerTableViewController.selectedAvailability{
            availability = selectedAvailability;
        }
    }
    
    @IBAction func unwindWithSelectedPhoto(segue: UIStoryboardSegue){
        if let AddImageViewController = segue.sourceViewController as? AddImageViewController,
            AddImageField = AddImageViewController.AddImageField{
            tempImage = AddImageField.image;
        }
    }
    
}