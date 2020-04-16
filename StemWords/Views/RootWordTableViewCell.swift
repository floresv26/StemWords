//
//  RootWordTableViewCell.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import UIKit

class RootWordTableViewCell: UITableViewCell, RootWordTableViewCellPresenterDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var rootWordLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    // MARK: - Properties
    
//    private let rootWordsCellPresenter: RootWordTableViewCellPresenterDelegate?
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
