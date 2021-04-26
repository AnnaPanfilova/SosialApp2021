//
//  GroupTableViewCell.swift
//  SocialApp
//
//  Created by Anna on 10.10.2020.
//

import UIKit

class GroupTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarView: CustomAvatar!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
