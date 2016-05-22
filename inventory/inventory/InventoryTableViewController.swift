//
//  InventoryTableViewController.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/3/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit
import Firebase

class InventoryTableViewController: UITableViewController{

    var ref = Firebase(url:"budheroinventory.firebaseIO.com");
    var cellSelected:Bool = true;
    var currentCell = 0;
    
    
    // MARK: Item variables
    
    var newItem: Item?;
    var items = [Item]();
    
    var selectedIndexPath : NSIndexPath?;
    let largeFont = UIFont(name: "Avenir-Book", size: 25.0);
    let smallFont = UIFont(name: "Avenir-Light", size: 17.0);

    @IBAction func cancelToInventoryTableViewController(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func saveItem(segue: UIStoryboardSegue){
        if let AddNewItemViewController = segue.sourceViewController as? AddNewItemViewController{
            if let item = AddNewItemViewController.item {
                let firebaseItem: NSDictionary = ["name": item.itemName, "type": item.itemType, "availability": item.itemAvailability];
                let itemRef = ref.childByAppendingPath("item");
                itemRef.childByAppendingPath(item.itemName).setValue(firebaseItem);
                
                let indexPath = NSIndexPath(forRow: items.count, inSection: 0);
                newItem = Item(withName: item.itemName, itemType: item.itemType, itemAvailability: item.itemAvailability, itemImage: item.itemImage);
                items.append(newItem!);
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic);
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = true;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {return 1;}
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return items.count;}
    
    required init?(coder aDecoder: NSCoder){
        print("Initialize InventoryTableViewController");
        super.init(coder: aDecoder);
    }
    
    deinit{print("DeInitialize InventoryTableViewController");}

    func AddNameToImage(drawText: NSString, inImage: UIImage, atPoint: CGPoint)->UIImage{
        let textColor = UIColor.whiteColor();
        let textFont: UIFont = UIFont(name: "Helvetica Bold", size: 20)!;
        UIGraphicsBeginImageContext(inImage.size);
        let textFontColor = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor];
        inImage.drawInRect(CGRectMake(0, 0, inImage.size.width, inImage.size.height));
        let rectangle: CGRect = CGRectMake(atPoint.x, atPoint.y, inImage.size.width, inImage.size.height);
        drawText.drawInRect(rectangle, withAttributes: textFontColor);
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
        let item = items[indexPath.row];
        cell.nameField.numberOfLines = 0;
        cell.nameField.font = largeFont;
        cell.nameField.allowsDefaultTighteningForTruncation = false;
        cell.nameField.layer.borderWidth = 4.0;
        cell.nameField.layer.cornerRadius = 10.0;
        cell.nameField.adjustsFontSizeToFitWidth = true;
        cell.nameField.textAlignment = NSTextAlignment.Center;
        cell.nameField.layer.borderColor = UIColor.clearColor().CGColor;
        cell.nameField.textColor = UIColor.whiteColor();
        cell.nameField.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7);
        cell.nameField.autoresizesSubviews = false;
        cell.nameField.text = item.itemName;
        
        cell.imageField.image = item.itemImage;
        cell.imageField.layer.cornerRadius = 8.0;
        
        cell.detailField.numberOfLines = 0;
        cell.detailField.allowsDefaultTighteningForTruncation = false;
        cell.detailField.layer.borderWidth = 2.0;
        cell.detailField.layer.cornerRadius = 5.0;
        cell.detailField.adjustsFontSizeToFitWidth = true;
        cell.detailField.textAlignment = NSTextAlignment.Center;
        cell.detailField.textColor = UIColor.whiteColor();
        cell.detailField.layer.borderColor = UIColor.clearColor().CGColor;
        cell.detailField.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7);
        cell.detailField.autoresizesSubviews = false;
        cell.detailField.text = item.itemType;
        
        cell.button.setTitle(item.itemAvailability, forState: UIControlState.Normal);
        item.itemAvailability = cell.button.titleLabel!.text!;
        cell.button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        cell.button.layer.cornerRadius = 5.0;
        cell.button.layer.borderWidth = 2.0;
        cell.button.layer.borderColor = UIColor.clearColor().CGColor;
        cell.button.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7);
        return cell
    }
}
