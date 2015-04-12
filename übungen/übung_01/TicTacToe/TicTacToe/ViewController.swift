//
//  ViewController.swift
//  TicTacToe
//
//  Created by labuser on 04.04.15.
//  Copyright (c) 2015 labuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextController = segue.destinationViewController as GameController
        
        if segue.identifier == "sp" {
            nextController.gameMode = true
        } else {
            nextController.gameMode = false
        }
        
    }

}

