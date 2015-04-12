//
//  ViewController.swift
//  colormixer
//
//  Created by labuser on 04.04.15.
//  Copyright (c) 2015 labuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red: UISwitch!
    @IBOutlet weak var green: UISwitch!
    @IBOutlet weak var blue: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func mixColor() {
        
        var r:CGFloat = self.red.on ? 1 : 0
        var g:CGFloat = self.green.on ? 1 : 0
        var b:CGFloat = self.blue.on ? 1 : 0
        
        colorView.backgroundColor = UIColor(red:r,green:g,blue:b,alpha:1)
        
    }

}

