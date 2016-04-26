//
//  ViewController.swift
//  Boom
//
//  Created by Ranjit Marathay on 4/25/16.
//  Copyright © 2016 hedgehogs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redPill: UIImageView!
    
    @IBOutlet weak var bluePill: UIImageView!
    
    @IBOutlet weak var hideredButton: UIButton!
    
    @IBOutlet weak var hideblueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func redButton(sender: AnyObject) {
        redPill.hidden = true;
        bluePill.hidden = false;
        
    }
    
    
    @IBAction func blueButton(sender: AnyObject) {
        bluePill.hidden = true;
        redPill.hidden = false;
    }

}

