//
//  GroupTableViewCell.swift
//  SocialApp
//
//  Created by Anna on 01.05.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarView: CustomAvatar!
    @IBOutlet weak var nameLabel: UILabel!
    let tapRec = UITapGestureRecognizer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tapRec.addTarget(self, action: #selector(self.animateImage))
        avatarView.addGestureRecognizer(tapRec)
    }
    
    @objc func animateImage() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 6, options: [.autoreverse]) {
            self.avatarView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            self.avatarView.transform = CGAffineTransform.identity
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
