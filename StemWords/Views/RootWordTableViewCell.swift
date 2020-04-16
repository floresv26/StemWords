//
//  RootWordTableViewCell.swift
//  StemWords
//
//  Created by Vanessa Flores on 4/16/20.
//  Copyright © 2020 Vanessa Flores. All rights reserved.
//

import UIKit

class RootWordTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var rootWordLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    // MARK: - Lifecycle
    
    func configure(with presenter: RootWordTableViewCellPresenter) {
        rootWordLabel.text = presenter.rootWord
        countLabel.text = presenter.rootWordCount
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
