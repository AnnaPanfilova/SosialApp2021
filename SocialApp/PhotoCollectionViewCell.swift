//
//  PhotoCollectionViewCell.swift
//  SocialApp
//
//  Created by Anna on 01.05.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    var likesChanged: ((Int) -> Void)?
    
    var likes = 0 {
        didSet {
            likeButton.setTitle(String(likes), for: .normal)
            
            var color = UIColor.darkGray
            var image = UIImage(systemName: "heart")
            
            if likes > 0 {
                color = UIColor.red
                image = UIImage(systemName: "heart.fill")
            }

            likeButton.tintColor = color
            likeButton.setTitleColor(color, for: .normal)
            likeButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        
        UIView.animateKeyframes(withDuration: 0.15, delay: 0, options: [.autoreverse]) {
            self.likeButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: {_ in
            if self.likes == 0 {
                self.likes += 1
            } else {
                self.likes -= 1
            }
            self.likesChanged?(self.likes)
        }
        
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if super.point(inside: point, with: event) {
            return true
        }
        
        return likeButton.point(inside: likeButton.convert(point, to: self), with: event)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = likeButton.hitTest(likeButton.convert(point, to: self), with: event)
        
        if view == nil {
            view = super.hitTest(point, with: event)
        }
        
        return view
    }
    
}
