//
//  CellDetailsViewController.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/4/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit

class CellDetailsViewController: UIViewController/*, UIImagePickerControllerDelegate, UINavigationControllerDelegate*/{
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBOutlet weak var EnterTypeField: UITextField!
    @IBOutlet weak var EnterNameField: UITextField!
    @IBOutlet weak var SelectorField: UIPickerView!
    @IBOutlet weak var UploadImageField: UIImageView!
    
    var new_item: Item?;
    var imageSelector = UIImagePickerController();
    var detailName = String();
    var detailType = String();
    var detailImage = UIImage?();
    
    @IBAction func cancelToInventoryTableViewController(segue: addItem){
        
    }
    
    @IBAction func saveToInventoryTableViewController(segue:
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(saveButton === sender){
            let name = EnterNameField.text;
            let type = EnterTypeField.text;
            let selection = SelectorField.dataSource;
            let image = UploadImageField.image;
//            new_item = Item(withName: name!, itemImage: image, itemType: type!, itemAvailability: selection! as! String);
        }
    }
    
    

}
