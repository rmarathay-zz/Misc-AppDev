//
//  ViewController.swift
//  ScaryBugs
//
//  Created by Ranjit Marathay on 5/3/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bugs = [ScaryBug]();

    override func viewDidLoad() {
        super.viewDidLoad()
        bugs = ScaryBug.bugs();
        automaticallyAdjustsScrollViewInsets = false;
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bugs.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BugCell", forIndexPath: indexPath);
        let bug = bugs[indexPath.row];
        cell.textLabel?.text = bug.name;
        cell.detailTextLabel?.text = ScaryBug.scaryFactorToString(bug.howScary);
        if let imageView = cell.imageView, bugImage = bug.image{
            imageView.image = bugImage;
        }
        return cell;
    }
}

