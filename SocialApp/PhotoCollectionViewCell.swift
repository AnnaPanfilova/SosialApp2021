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
    
    var likesChanged: ((Int, Bool) -> Void)?
    
    var photo: Photo?
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.15, delay: 0, options: [.autoreverse]) {
            self.likeButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: {_ in
            guard var photo = self.photo else {
                return
            }
            
            if !photo.isLiked {
                photo.likes += 1
            } else {
                photo.likes -= 1
            }
            photo.isLiked = !photo.isLiked
            
            self.photo = photo
            
            self.configureLikes(photo: photo)
            
            self.likesChanged?(photo.likes, photo.isLiked)
            
            self.likeButton.transform = CGAffineTransform.identity
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
    
    func configure(photo: Photo) {
        self.photo = photo
        
        photoImageView.image = photo.image
        configureLikes(photo: photo)
    }
    
    func configureLikes(photo: Photo) {
        likeButton.setTitle(String(photo.likes), for: .normal)
        
        var color = UIColor.darkGray
        var image = UIImage(systemName: "heart")
        
        if photo.isLiked {
            color = UIColor.red
            image = UIImage(systemName: "heart.fill")
        }

        likeButton.tintColor = color
        likeButton.setTitleColor(color, for: .normal)
        likeButton.setImage(image, for: .normal)
    }
    
}
