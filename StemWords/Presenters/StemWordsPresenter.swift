//
//  StemWordsPresenter.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import Foundation

protocol StemWordsPresenterDelegate: NSObjectProtocol {
    func updateStemWords(with models: [RootWordTableViewCellPresenter])
}

class StemWordsPresenter {
    
    // MARK: - Properties
    
    var stemWordModels: [RootWordTableViewCellPresenter] = []
    private var stemWords: [String: Int] = [:]
    private let grammarRules = GrammarRules()
    weak private var delegate: StemWordsPresenterDelegate?
    
    func setViewDelegate(delegate: StemWordsPresenterDelegate?) {
        self.delegate = delegate
    }
    
    func findRootWords(from string: String) {
        let originalWords = extractedWords(from: string)
        
        originalWords.forEach { word in
            // check if has removableSuffix
            if let rootWord = removableSuffix(from: word, suffixes: grammarRules.removableSuffix) {
                addStemWord(word: rootWord)
            } else if let rootWord = replaceableSuffix(from: word, suffixes: grammarRules.replaceableSuffix) {
                addStemWord(word: rootWord)
            } else {
                addStemWord(word: word)
            }
        }
        
        updateStemWordModels()
        delegate?.updateStemWords(with: stemWordModels)
    }
    
    func clearStemWords() {
        stemWordModels = []
        delegate?.updateStemWords(with: stemWordModels)
    }
    
    // MARK: - Helpers
    
    private func extractedWords(from string: String) -> [String] {
        let words = string.components(separatedBy: " ")
        let unwantedCharacters = CharacterSet.letters.inverted
        var cleanWords: [String] = []
        
        // remove non alphabetic characters from words
        words.forEach { word in
            let cleanWord = word.components(separatedBy: unwantedCharacters).joined()
            cleanWords.append(cleanWord)
        }
        
        return cleanWords
    }
    
    private func removableSuffix(from word: String, suffixes: [String]) -> String? {
        var rootWord: String?
        
        _ = suffixes.first { suffix -> Bool in
            guard word.count >= suffix.count else {
                return false
            }
            
            let substring = word.suffixExtractor(withLength: suffix.count)
            
            if substring.caseInsensitiveCompare(suffix) == .orderedSame {
                rootWord = rootWordExtractor(word: word, suffix: suffix)
                
                return true
            } else {
                return false
            }
        }
        
        return rootWord
    }
    
    private func rootWordExtractor(word: String, suffix: String) -> String {
        var mutableWord = word
        let range = mutableWord.suffixRange(suffix.count)
        mutableWord.removeSubrange(range)
        
        return mutableWord
    }
    
    private func replaceableSuffix(from word: String, suffixes: [String: String]) -> String? {
        var rootWord: String?
        
        _ = suffixes.first(where: { (suffix, replacement) -> Bool in
            guard word.count >= suffix.count else {
                return false
            }
            
            let substring = word.suffixExtractor(withLength: suffix.count)
            
            if substring.caseInsensitiveCompare(suffix) == .orderedSame {
                rootWord = wordWithReplaceableSuffix(from: word, suffix: suffix, replacement: replacement)
                
                return true
            } else {
                return false
            }
        })
        
        return rootWord
    }
    
    private func wordWithReplaceableSuffix(from word: String, suffix: String, replacement: String) -> String {
        var mutableWord = word
        let range = mutableWord.suffixRange(suffix.count)
        mutableWord.replaceSubrange(range, with: replacement)
        
        return mutableWord
    }
    
    private func addStemWord(word: String) {
        if stemWords.keys.contains(word) {
            stemWords[word]! += 1
        } else {
            stemWords[word] = 1
        }
    }
    
    private func updateStemWordModels() {
        let updatedStemWordModels = stemWords.map { (rootWord, count) -> RootWordTableViewCellPresenter in
            let presenter = RootWordTableViewCellPresenter(rootWord: rootWord, rootWordCount: String(count))
            
            return presenter
        }
        
        stemWordModels = updatedStemWordModels
    }
}
