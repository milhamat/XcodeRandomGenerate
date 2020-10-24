import XCPlayground
import UIKit
import PlaygroundSupport

public class BallView: UIView {
    override public init(frame: CGRect){
        super.init(frame: CGRect(x: 0 ,y: 0, width: 640, height: 480))
        
        let ball: UIView =
        {
            let ball = UIView()
            ball.backgroundColor = .blue
            ball.frame = CGRect(x: 4, y: 4, width: 50, height: 50)
            
            ball.layer.cornerRadius = ball.frame.size.width / 2
            ball.clipsToBounds = true
            return ball
        }()
        self.addSubview(ball)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
