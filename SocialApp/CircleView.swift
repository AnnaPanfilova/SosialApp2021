//
//  CustomAvatar.swift
//  SocialApp
//
//  Created by Anna on 07.05.2021.
//
import Foundation
import UIKit

@IBDesignable class CircleView: UIView {
    
    @IBInspectable var size: CGFloat = 8 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
          setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        view.backgroundColor = color
        view.layer.cornerRadius = size / 2
        
        self.addSubview(view)
    }
}
