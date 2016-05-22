//
//  ItemTableViewCell.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/3/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit

import Firebase

class ItemTableViewCell: UITableViewCell{
    let ref = Firebase(url: "budheroinventory.firebaseIO.com");
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var detailField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        if(button.titleLabel!.text == "Available"){
            button.setTitle("Out of Stock", forState: UIControlState.Normal);
            updateAvailability("Out of Stock");
        }
        if(button.titleLabel!.text == "Select Availability"){
            button.setTitle("Available", forState: UIControlState.Normal);
            updateAvailability("Available");
        }
        if(button.titleLabel!.text == "Out of Stock"){
            button.setTitle("Available", forState: UIControlState.Normal);
            updateAvailability("Available");
        }
    }
    
    func updateAvailability(a: String){
        let inventoryRef = ref.childByAppendingPath("item");
        let itemRef = inventoryRef.childByAppendingPath(nameField.text);
        let newAvailabilty = ["availability": a];
        itemRef.updateChildValues(newAvailabilty);
    }

    //override func
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        let color = UIColor.lightGrayColor().colorWithAlphaComponent(0.7);
        super.setSelected(selected, animated: animated)
        if(selected){
            button.backgroundColor = color;
            nameField.backgroundColor = color;
            detailField.backgroundColor = color;
        }

    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        let color = UIColor.lightGrayColor().colorWithAlphaComponent(0.7);
        super.setHighlighted(highlighted, animated: animated)
        if(highlighted){
            button.backgroundColor = color;
            nameField.backgroundColor = color;
            detailField.backgroundColor = color;
        }
    }
    

}
