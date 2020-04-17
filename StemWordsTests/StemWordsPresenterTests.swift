//
//  StemWordsPresenterTests.swift
//  StemWordsTests
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import StemWords

class StemWordsPresenterTests: XCTestCase {
    
    var sut: StemWordsPresenter!
    
    override func setUp() {
        super.setUp()
        
        sut = StemWordsPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func test_findRootWords_whenWordContainsNonAlphabeticChars_returnAlphabeticCharsOnly() {
        sut.findRootWords(from: "SUZNK3H.")
        let stemWordModel = sut.stemWordModels.first
        
        XCTAssertEqual(stemWordModel?.rootWord, "SUZNKH")
    }
    
    func test_extractedWords_whenMultiWordText_returnMultipleStemWords() {
        sut.findRootWords(from: "SUZNK3H. KMZLZ KH KMZPZL EVBFUEZL")
        
        XCTAssertEqual(sut.stemWordModels.count, 5)
    }
    
    func test_findRootWord_whenMultipleSuffixesMatch_returnMostAccurateMatch() {
        sut.findRootWords(from: "EVBFUEZL")
        let stemWordModel = sut.stemWordModels.first
        
        XCTAssertEqual(stemWordModel?.rootWord, "EVBFUR")
    }
    
    func test_findRootWords_whenDoubleeStemWordMatch_stemWordCountIs() {
        sut.findRootWords(from: "GHUKLZ GHUKL")
        let stemWordModel = sut.stemWordModels.first { $0.rootWord.caseInsensitiveCompare("GHUK") == .orderedSame }
        
        XCTAssertEqual(stemWordModel?.rootWordCount, "2")
    }
    
    func test_findRootWords_whenNoMatchingSuffix_thenAddWordToStemWords() {
        sut.findRootWords(from: "NOMATCH")
        let stemWordModel = sut.stemWordModels.first
        
        XCTAssertEqual(stemWordModel?.rootWord, "NOMATCH")
    }
    
    func test_clearStemWords_thenStemWordsModelsIsEmpty() {
        sut.findRootWords(from: "SUZNK3H. KMZLZ KH KMZPZL EVBFUEZL")
        
        XCTAssertEqual(sut.stemWordModels.count, 5)
        
        sut.clearStemWords()
        
        XCTAssertEqual(sut.stemWordModels.count, 0)
    }

}
