import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        }else{
            if Core.shared.isLogin() {
                print("bisa")
                let vclogin = storyboard?.instantiateViewController(identifier: "mainScreen") as! UITabBarController
                vclogin.modalPresentationStyle = .fullScreen
                present(vclogin, animated: true)
            }else{
            let vcdefault = storyboard?.instantiateViewController(identifier: "signInScreen") as! SignInViewController
            vcdefault.modalPresentationStyle = .fullScreen
            present(vcdefault, animated: true)
            print("false harusnya ini")
                
            }
        }
    }


}


class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    ///
    func setIsNotNewUser() {
        UserDefaults.standard.set(true,forKey: "isNewUser")
        
    }
    func isLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLogin")
    }
}
