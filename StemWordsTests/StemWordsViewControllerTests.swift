//
//  StemWordsViewControllerTests.swift
//  StemWordsTests
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import StemWords

class StemWordsViewControllerTests: XCTestCase {
    
    let presenter = StemWordsPresenterMock()
    var sut: StemWordsViewController!
    var tableView: UITableView!
    var textField: UITextField!
    
    override func setUp() {
        super.setUp()
        
        sut = StemWordsViewController()
        sut.presenter = presenter
        
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func test_viewDidLoad_whenEmptyTextField_findRootButtonDisabled() {
        
        XCTAssertTrue(sut.findRootButton.isEnabled)
    }
}

class StemWordsPresenterMock: StemWordsPresenter {
    
//    var stemWordModels: [RootWordTableViewCellPresenter]  = MockObjects.stemWordModels
    
}

class MockObjects {
    
    static let textString = "KMZLZ KUFKML KH KMZPZL MDCCEVZLL EVBFUEZL KMZL"
    static let stemWords = ["KMZ": 2, "KUFKM": 1, "KH": 1, "KMZAZ": 1, "MDCCEVZL" : 1, "EVBFUR": 1]
    
    static private let stemWordModel1 = RootWordTableViewCellPresenter(rootWord: "KMZ", rootWordCount: "2")
    static private let stemWordModel2 = RootWordTableViewCellPresenter(rootWord: "KUFKM", rootWordCount: "1")
    static private let stemWordModel3 = RootWordTableViewCellPresenter(rootWord: "KH", rootWordCount: "1")
    static private let stemWordModel4 = RootWordTableViewCellPresenter(rootWord: "KMZAZ", rootWordCount: "1")
    static private let stemWordModel5 = RootWordTableViewCellPresenter(rootWord: "MDCCEVZL", rootWordCount: "1")
    static private let stemWordModel6 = RootWordTableViewCellPresenter(rootWord: "EVBFUR", rootWordCount: "1")
    
    static let stemWordModels: [RootWordTableViewCellPresenter] = [stemWordModel1, stemWordModel2, stemWordModel3, stemWordModel4, stemWordModel5, stemWordModel6]
    
}


