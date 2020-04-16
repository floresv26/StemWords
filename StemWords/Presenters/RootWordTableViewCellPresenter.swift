//
//  RootWordTableViewCellPresenter.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import Foundation

protocol RootWordTableViewCellPresenterDelegate: NSObjectProtocol {
    
}

class RootWordTableViewCellPresenter {
    
    // MARK: - Properties
    
    private let rootWord: String
    private let rootWordCount: Int
    private weak var delegate: RootWordTableViewCellPresenterDelegate?
    
    // MARK: - Initializers
    
    init(rootWord: String, rootWordCount: Int) {
        self.rootWord = rootWord
        self.rootWordCount = rootWordCount
    }
    
    func setViewDelegate(delegate: RootWordTableViewCellPresenterDelegate?) {
        self.delegate = delegate
    }
}
