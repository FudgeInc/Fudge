//
//  CollectionDetailTableViewCell.swift
//  Fudge
//
//  Created by Matt on 4/12/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit

class CollectionDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var createdByLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    var recipe: Recipe!{
        didSet{
            createdByLabel.text = recipe.creator?.username
            recipeNameLabel.text = recipe.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        createdByLabel.preferredMaxLayoutWidth = createdByLabel.frame.size.width
        recipeNameLabel.preferredMaxLayoutWidth = recipeNameLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
