//
//  FriendCell.swift
//  Fudge
//
//  Created by Devon Maguire on 4/13/16.
//  Copyright © 2016 fudgeInc. All rights reserved.
//

import UIKit
import Contacts

class FriendCell: UITableViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var middleName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    var contact: CNContact!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}