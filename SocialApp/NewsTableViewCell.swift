//
//  NewsTableViewCell.swift
//  SocialApp
//
//  Created by Anna on 12.05.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photo1ImageView: UIImageView!
    @IBOutlet weak var photo2ImageView: UIImageView!
    @IBOutlet weak var photo3ImageView: UIImageView!
    @IBOutlet weak var photo4ImageView: UIImageView!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var viewsButton: UIButton!
    
    func configure(news: News) {
        titleLabel.text = news.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm"
        dateLabel.text = dateFormatter.string(from: news.date)
        
        descriptionLabel.text = news.text
        
        photo1ImageView.image = news.photos.count > 0 ? news.photos[0] : nil
        photo2ImageView.image = news.photos.count > 1 ? news.photos[1] : nil
        photo3ImageView.image = news.photos.count > 2 ? news.photos[2] : nil
        photo4ImageView.image = news.photos.count > 3 ? news.photos[3] : nil
        
        likesButton.setTitle(String(news.likes), for: .normal)
        commentsButton.setTitle(String(news.comments), for: .normal)
        shareButton.setTitle(String(news.shares), for: .normal)
        viewsButton.setTitle(String(news.views), for: .normal)
    }
    
}
