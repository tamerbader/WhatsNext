//
//  TaskCell.swift
//  WhatsNext
//
//  Created by MetroStar on 8/9/17.
//  Copyright © 2017 TamerBader. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskTime: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
