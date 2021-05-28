//
//  PushAnimator.swift
//  SocialApp
//
//  Created by Anna on 28.05.2021.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let destination = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        
        let translation = CGAffineTransform(translationX: -source.view.frame.width / 2, y: source.view.frame.height / 3 * 2)
        let rotation = CGAffineTransform(rotationAngle: -90)
        destination.view.transform = translation.concatenating(rotation)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {

            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 1,
                               animations: {
                                   destination.view.transform = .identity
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }

    }
    

}
