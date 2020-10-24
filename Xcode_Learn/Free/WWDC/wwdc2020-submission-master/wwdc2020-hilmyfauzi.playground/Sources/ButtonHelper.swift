import UIKit

public class MainButton: UIButton {
    var myValue: Int
    
    override init(frame: CGRect) {
        self.myValue = 0
        
        super.init(frame: frame)
        
        setUIButton()
    }
    
    public func setUIButton() {
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        self.titleLabel?.font = UIFont(name: K.Font.AvenirNext.Bold, size: 30)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class ChoiceButton: UIButton {
    var myValue: Int
    
    override init(frame: CGRect) {
        self.myValue = 0
        
        super.init(frame: frame)
        setUIButton()
    }
    
    public func setUIButton() {
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        self.titleLabel?.font = UIFont(name: K.Font.AvenirNext.Medium, size: 20)
        self.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
