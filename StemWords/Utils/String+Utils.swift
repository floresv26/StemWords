//
//  String+Utils.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import Foundation

extension String {
    
    func suffixExtractor(withLength length: Int) -> Substring {
        let range = suffixRange(length)
        
        return self[range]
    }
    
    func suffixRange(_ length: Int) -> Range<Index> {
        let end = self.endIndex
        let start = self.index(self.endIndex, offsetBy: -length)
        
        return start..<end
    }
}
