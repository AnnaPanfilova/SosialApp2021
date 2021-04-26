//
//  FriendTableViewCell.swift
//  SocialApp
//
//  Created by Anna on 10.10.2020.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    

    @IBOutlet weak var avatarView: CustomAvatar!
    @IBOutlet weak var ageLabel: UILabel!
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
