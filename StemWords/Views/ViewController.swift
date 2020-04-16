//
//  ViewController.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, StemWordsPresenterDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var findRootButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var clearRootsButton: UIButton!
    
    // MARK: - Properties
    
    private let presenter = StemWordsPresenter()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        presenter.setViewDelegate(delegate: self)
        
        if presenter.stemWordModels.isEmpty {
            clearRootsButton.isHidden = true
            tableView.isHidden = true
        }
        
        tableView.register(UINib(nibName: "RootWordTableViewCell", bundle: nil), forCellReuseIdentifier: "RootWordCellIdentifier")
    }
    
    func updateStemWords(with models: [RootWordTableViewCellPresenter]) {
        tableView.reloadData()
        
        models.forEach { print($0.rootWord) }
        
        if !presenter.stemWordModels.isEmpty {
            clearRootsButton.isEnabled = true
            clearRootsButton.isHidden = false
            tableView.isHidden = false
        } else {
            clearRootsButton.isEnabled = false
            clearRootsButton.isHidden = true
            tableView.isHidden = true
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.stemWordModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RootWordCellIdentifier", for: indexPath) as? RootWordTableViewCell else {
            fatalError("RootWordCellIdentifier does not exist.")
        }
        
        cell.configure(with: presenter.stemWordModels[indexPath.row])
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableCell(withIdentifier: "RootWordCellIdentifier") as? RootWordTableViewCell else {
            fatalError("RootWordCellIdentifier does not exist.")
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    // MARK: - Actions
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        if let text = textField.text, !text.isEmpty {
            findRootButton.isEnabled = true
        } else {
            findRootButton.isEnabled = false
        }
    }
    
    @IBAction func textFieldDonePressed(_ sender: Any) {
        findRoots()
    }
    
    @IBAction func findRootsButtonPressed(_ sender: Any) {
        findRoots()
    }
    
    @IBAction func clearRootsButtonPressed(_ sender: Any) {
        presenter.clearStemWords()
        clearRootsButton.isEnabled = false
    }
    
    // MARK: - Helpers
    
    private func findRoots() {
        if let text = textField.text, !text.isEmpty {
            presenter.findRootWords(from: text)
            textField.text = nil
            findRootButton.isEnabled = false
        }
    }
    
}

