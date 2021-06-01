//
//  PhotoDetailViewController.swift
//  SocialApp
//
//  Created by Anna on 21.05.2021.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photo1ImageView: UIImageView!
    @IBOutlet weak var photo2ImageView: UIImageView!
    
    var photos: [Photo] = []
    var photoNum: Int = 0
    var animates = false

    override func viewDidLoad() {
        super.viewDidLoad()

        photo1ImageView.image = photos[photoNum].image
        
        let recognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        recognizerLeft.direction = .left
        view.addGestureRecognizer(recognizerLeft)
        
        let recognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        recognizerRight.direction = .right
        view.addGestureRecognizer(recognizerRight)
    }
    
    func swipeLeft() {
        if photoNum >= photos.count - 1 {
            return
        }
        
        if animates {
            return
        }
        
        animates = true
        photoNum += 1
        photo2ImageView.image = photos[photoNum].image
        
        UIView.animate(withDuration: 0.5) {
            self.photo1ImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.photo1ImageView.alpha = 0.5
            self.photo2ImageView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        } completion: { _ in
            self.animates = false
            self.photo1ImageView.image = self.photo2ImageView.image
            self.photo1ImageView.alpha = 1
            self.photo1ImageView.transform = CGAffineTransform.identity
            self.photo2ImageView.transform = CGAffineTransform.identity
        }

    }
    
    func swipeRight() {
        if photoNum == 0 {
            return
        }
        
        if animates {
            return
        }
        
        animates = true
        photoNum -= 1
        photo2ImageView.image = photo1ImageView.image
        photo1ImageView.image = photos[photoNum].image
        photo1ImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        photo1ImageView.alpha = 0.5
        photo2ImageView.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        
        UIView.animate(withDuration: 0.5) {
            self.photo1ImageView.alpha = 1
            self.photo1ImageView.transform = CGAffineTransform.identity
            self.photo2ImageView.transform = CGAffineTransform.identity
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
