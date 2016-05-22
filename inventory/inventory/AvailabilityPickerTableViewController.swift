//
//  AvailabilityPickerTableViewController.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/8/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit

class AvailabilityPickerTableViewController: UITableViewController{

    // MARK: User Defined Data
    
    var availability:[String] = ["Out of Stock","Available"];
    var selectedAvailabilityIndex:Int?;
   
    var selectedAvailability:String?{
        didSet{
            if let a = selectedAvailability{
                selectedAvailabilityIndex = availability.indexOf(a)!;
            }
        }
    }

    // MARK: Default Class Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availability.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemAvailabilityCell", forIndexPath: indexPath);
        cell.textLabel?.text = availability[indexPath.row];
        if indexPath.row == selectedAvailabilityIndex{
            cell.accessoryType = .Checkmark;
            
        }
        else{
            cell.accessoryType = .None;
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        if let index = selectedAvailabilityIndex{
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0));
            cell?.accessoryType = .None;
        }
        selectedAvailability = availability[indexPath.row];
        let cell = tableView.cellForRowAtIndexPath(indexPath);
        cell?.accessoryType = .Checkmark;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveSelectedAvailability"){
            if let cell = sender as? UITableViewCell{
                let indexPath = tableView.indexPathForCell(cell);
                if let index = indexPath?.row{
                    selectedAvailability = availability[index];
                }
            }
        }
    }

}
