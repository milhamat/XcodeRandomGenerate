import UIKit

public class AnimationHelper {
    public class func fadeIn(animatedView: UIView) {
        animatedView.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseIn, animations: {
            animatedView.alpha = 1.0
        }, completion: nil)
    }
    
    public class func fadeOut(animatedView: UIView) {
        animatedView.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            animatedView.alpha = 0.0
        }
    }
    
    public class func rotateAnimation(targetView: UIView, duration: CFTimeInterval = 2.0) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")

        rotateAnimation.fromValue = CGFloat(.pi / -4.0)
        rotateAnimation.toValue = CGFloat(.pi / 4.0)
        rotateAnimation.duration = duration
        rotateAnimation.autoreverses = true
        rotateAnimation.repeatCount = .greatestFiniteMagnitude
        
        targetView.layer.add(rotateAnimation, forKey: nil)
    }
}
