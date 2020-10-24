import UIKit

public class ViewHelper {
    public class func squareImgConfig(imgName: String) -> UIImage {
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .large)
        return (UIImage(systemName: imgName, withConfiguration: config)?.withTintColor(.white, renderingMode: .alwaysOriginal))!
    }

    public class func setMainImg() -> UIImage? {
        guard let path = Bundle.main.path(forResource: "bg_earthquake", ofType: "jpg") else {
            print("Background Image Not Found")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }

    public class func changeView(from currentController: UIViewController, to nextController: UIViewController, transition: UIView.AnimationOptions) {
        UIView.transition(from: currentController.view, to: nextController.view, duration: 0.8, options: transition) { (_) in
            currentController.navigationController?.pushViewController(nextController, animated: false)
        }
    }
}
