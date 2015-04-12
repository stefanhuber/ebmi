//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by labuser on 04.04.15.
//  Copyright (c) 2015 labuser. All rights reserved.
//

import Foundation

class TicTacToeGame {

    let X = "X"
    let O = "O"

    var gameState = ["1","2","3","4","5","6","7","8","9"]
    var moveCount = 0
    
    func checkWinner() -> String {
        
        for var x = 0; x < 3; x++ {
            if (gameState[x] == gameState[x+3] && gameState[x+3] == gameState[x+6]) {
                return gameState[x]
            }
        }

        for var i = 0; i < 9; i=i+3 {
            if (gameState[i] == gameState[i+1] && gameState[i+1] == gameState[i+2]) {
                return gameState[i]
            }
        }
        
        if (gameState[0] == gameState[4] && gameState[4] == gameState[8]) {
            return gameState[0]
        }
        
        if (gameState[2] == gameState[4] && gameState[4] == gameState[6]) {
            return gameState[2]
        }
        
        return ""
    }
    
    func isGameOver() -> (Bool,String) {
        var player = checkWinner()
        var over = false
        
        if (self.moveCount >= 8) {
            over = true
        } else {
            over = (player == "X" || player == "O")
        }
        
        return (over,player)
    }
    
    func nextMove(pos:Int) -> Bool {
        if (pos < 0 || pos > 8) {
            return false
        }
        if (gameState[pos] == "X" || gameState[pos] == "O") {
            return false
        }
        if (moveCount > 8) {
            return false
        }
        
        var player = moveCount % 2
        if player == 0 {
            gameState[pos] = X
        } else {
            gameState[pos] = O
        }
        moveCount++
        
        return true
    }
    
    func computerMove() {
        while true {
            if nextMove(Int(arc4random_uniform(9))) {
                break
            }
        }
    }

    func start() {
        gameState = ["1","2","3","4","5","6","7","8","9"]
        moveCount = 0
    }
}