//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by labuser on 04.04.15.
//  Copyright (c) 2015 labuser. All rights reserved.
//

import UIKit
import XCTest

class TicTacToeTests: XCTestCase {
    
    var game:TicTacToeGame!
    
    override func setUp() {
        super.setUp()
        game = TicTacToeGame()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartSetGameCountToZero() {
        game.start()
        XCTAssertEqual(["","","","","","","","",""], game.gameState, "No valid Game state")
        XCTAssertEqual(0, game.moveCount, "Wrong count")
    }
    
    func testFirstMoveOfXOnPositionFive() {
        game.nextMove(4)
        XCTAssertEqual(["","","","","X","","","",""], game.gameState, "No valid Game state")
        XCTAssertEqual(1, game.moveCount, "Wrong count")
    }
    
    func testInvalidMove() {
        var result = game.nextMove(666)
        XCTAssertFalse(result, "Move is falsly vaild")
    }
    
    func testFieldIsAlreadySet() {
        game.nextMove(5)
        var result = game.nextMove(5)
        XCTAssertFalse(result, "Move is falsly vaild")
        XCTAssertEqual(["","","","","","X","","",""], game.gameState, "No valid Game state")
    }
    
    
}
