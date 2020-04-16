//
//  RootWordTableViewCellPresenter.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import Foundation

class RootWordTableViewCellPresenter {
    
    // MARK: - Properties
    
    let rootWord: String
    let rootWordCount: String
    
    // MARK: - Initializers
    
    init(rootWord: String, rootWordCount: String) {
        self.rootWord = rootWord
        self.rootWordCount = rootWordCount
    }
}
