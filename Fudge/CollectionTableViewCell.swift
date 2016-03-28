//
//  CollectionTableViewCell.swift
//  Fudge
//
//  Created by Matt on 3/27/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var numRecipesLabel: UILabel!
    var collectionId: String!
    
    var collection : Collection!{
        didSet{
            collectionNameLabel.text=collection.name
            numRecipesLabel.text = String(collection.recipes!.count) + " Recipes"
            self.collectionId = collection.collectionId
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        //set autolayout text wrapping
        numRecipesLabel.preferredMaxLayoutWidth = numRecipesLabel.frame.size.width
        
        collectionNameLabel.preferredMaxLayoutWidth = collectionNameLabel.frame.size.width
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
