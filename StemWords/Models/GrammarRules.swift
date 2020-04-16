//
//  GrammarRules.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import Foundation

struct GrammarRules {
    
    let removableSuffix = ["L", "LZ", "EVM", "ZQ"]
    let replaceableSuffix = ["PZ": "A", "PZL": "AZ", "EZL": "R"]
}
