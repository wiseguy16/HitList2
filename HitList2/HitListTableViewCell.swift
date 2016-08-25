//
//  HitListTableViewCell.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class HitListTableViewCell: UITableViewCell
{

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var pictView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
