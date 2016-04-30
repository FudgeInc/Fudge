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
            //TODO: fix this so it displays the name properly
            createdByLabel.text = ""
            recipeNameLabel.text = recipe.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
