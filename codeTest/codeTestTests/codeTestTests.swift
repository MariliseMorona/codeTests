//
//  codeTestTests.swift
//  codeTestTests
//
//  Created by marilise morona on 06/11/23.
//

@testable import codeTest
import XCTest
import Combine

final class CodeTestTests: XCTestCase {
    
    private var viewModel: CodeViewModel!

    override func setUp(){
        super.setUp()
        viewModel = .init()
    }

    func testDefaultInitialState(){
        XCTAssertEqual(viewModel.state,
                       CodeViewState(
                        ageUser: "",
                        message: ""))
        XCTAssertTrue(viewModel.state.isEmptyAge)
        XCTAssert(viewModel.state.message.isEmpty, viewModel.state.testError)
            
    }
    
    func testIfInputPresentCharacters(){
        viewModel.updateState(ageUser: "#23", message: "")
        XCTAssertTrue(viewModel.state.presentSpecialCharacters, viewModel.state.testError)
    }
    
    func testIfInputPresentLetters(){
        viewModel.updateState(ageUser: "as3", message: "")
        XCTAssertTrue(viewModel.state.presentLetters, viewModel.state.testError)
    }
    
    func testIfInputContainsWhiteSpace(){
        viewModel.updateState(ageUser: " er", message: "")
        XCTAssertTrue(viewModel.state.containsWhitespace, viewModel.state.testError)
    }
    
    func testIfInputIsEqualMaxValue(){
        viewModel.updateState(ageUser: "10", message: "")
        XCTAssertEqual(viewModel.state.ageUser, String(viewModel.state.maxValue))
    }
    
    func testIfInputIsEqualMinValue(){
        viewModel.updateState(ageUser: "0", message: "")
        XCTAssertEqual(viewModel.state.ageUser, String(viewModel.state.minValue))
    }
}
