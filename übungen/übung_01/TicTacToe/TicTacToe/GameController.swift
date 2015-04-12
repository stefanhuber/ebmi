//
//  GameControllerViewController.swift
//  TicTacToe
//
//  Created by labuser on 04.04.15.
//  Copyright (c) 2015 labuser. All rights reserved.
//

import UIKit

class GameController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // true  = sp
    // false = mp
    var gameMode = true
    var tictactoe:TicTacToeGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tictactoe = TicTacToeGame()
        startGame()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame() {
        tictactoe.start()
        for view in self.view.subviews {
            if view.tag == 123 {
                var collectionView = view as UICollectionView
                
                if gameMode { // single player
                    var rand = arc4random_uniform(2)
                    if rand > 0 {
                        tictactoe.computerMove()
                    }
                }
                
                collectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var empty = collectionView.dequeueReusableCellWithReuseIdentifier("item-empty", forIndexPath: indexPath) as UICollectionViewCell
        var o = collectionView.dequeueReusableCellWithReuseIdentifier("item-o", forIndexPath: indexPath) as UICollectionViewCell
        var x = collectionView.dequeueReusableCellWithReuseIdentifier("item-x", forIndexPath: indexPath) as UICollectionViewCell
        
        var section = indexPath.section
        var item = indexPath.item
        var state = tictactoe.gameState[section * 3 + item]
        
        if ("X" == state) {
            return x
        } else if "O" == state {
            return o
        }
        
        return empty
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var section = indexPath.section
        var item = indexPath.item
        tictactoe.nextMove(section * 3 + item)
        
        if gameMode { // single player
            tictactoe.computerMove()
        }
        
        var (over,winner) = tictactoe.isGameOver()
        if (over) {
            var finalController = UIAlertController()
            finalController.title = "Game Over"
            
            if winner == "" {
                finalController.message = "Es ist unentschieden, nochmal spielen?"
            } else {
                finalController.message = winner + " hat gewonnen, nochmal spielen?"
            }
            
            finalController.addAction(UIAlertAction(title: "Ja", style: UIAlertActionStyle.Default, handler: {
                (action) -> Void in
                finalController.dismissViewControllerAnimated(true, completion: nil)
                self.startGame()
            }))
            
            finalController.addAction(UIAlertAction(title: "Nein", style: UIAlertActionStyle.Cancel, handler: {
                (action) -> Void in
                
                self.presentViewController(
                    self.storyboard?.instantiateViewControllerWithIdentifier("mainController") as ViewController,
                    animated: true,
                    completion: nil)
            }))
            
            self.presentViewController(finalController, animated: true, completion: nil)
        }
        
        collectionView.reloadData()
    }
    
}
