//
//  NewsDetailViewController.swift
//  SocialApp
//
//  Created by Anna on 01.06.2021.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var newsItem: News?
    var photoNum = 0
    var animates = false

    override func viewDidLoad() {
        super.viewDidLoad()

        image2.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
        
        if let newsItem = newsItem {
            image1.image = newsItem.photos.count > 0 ? newsItem.photos[0] : nil
            titleLabel.text  = newsItem.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy hh:mm"
            dateLabel.text = dateFormatter.string(from: newsItem.date)
            textLabel.text = newsItem.text
            
            if newsItem.photos.count > 1 {
                let recognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
                recognizerLeft.direction = .left
                view.addGestureRecognizer(recognizerLeft)
                
                let recognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
                recognizerRight.direction = .right
                view.addGestureRecognizer(recognizerRight)
            }
        }
        
    }
    
    func swipeLeft() {
        guard let photos = newsItem?.photos else {
            return
        }
        
        if photoNum >= photos.count - 1 {
            return
        }
        
        if animates {
            return
        }
        
        animates = true
        photoNum += 1
        image2.image = photos[photoNum]
        
        UIView.animate(withDuration: 0.5) {
            self.image1.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.image1.alpha = 0.5
            self.image2.transform = CGAffineTransform.identity
        } completion: { _ in
            self.animates = false
            self.image1.image = self.image2.image
            self.image1.alpha = 1
            self.image1.transform = CGAffineTransform.identity
            self.image2.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        }

    }
    
    func swipeRight() {
        guard let photos = newsItem?.photos else {
            return
        }
        
        if photoNum == 0 {
            return
        }
        
        if animates {
            return
        }
        
        animates = true
        photoNum -= 1
        image2.image = image1.image
        image1.image = photos[photoNum]
        image1.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        image1.alpha = 0.5
        image2.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.5) {
            self.image1.alpha = 1
            self.image1.transform = CGAffineTransform.identity
            self.image2.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        } completion: { _ in
            self.animates = false
        }
    }
    
    
    @objc func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .left {
            swipeLeft()
        }
        if recognizer.direction == .right {
            swipeRight()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
