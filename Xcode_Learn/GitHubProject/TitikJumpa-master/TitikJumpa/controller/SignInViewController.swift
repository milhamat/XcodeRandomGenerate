//
//  SignInViewController.swift
//  TitikJumpa
//
//  Created by Franky Chainoor Johari on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CloudKit

class SignInViewController: UIViewController {

    let publicdatabase = CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase
    
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!
    
    public var verifyStatus = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }

    
    class CoreSign {
        
        static let sharedLogin = CoreSign()
        
        func isLogin() -> Bool {
            return UserDefaults.standard.bool(forKey: "isLogin")
        }
        
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        // Haptic
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        if emailfield.text?.isEmpty == false && passwordfield.text?.isEmpty == false{
            validate(emailverify: emailfield.text!, passwordverify: passwordfield.text!) { (result) in
                  switch result {
                  case .success(let cek):
                      if cek == true {
                          self.performSegue(withIdentifier: "mainScreen", sender: nil)
                      }else{
                          let alert = UIAlertController(title: "Username/Password Wrong", message: "Username/Password wrong. Case Sensitive", preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                              //action
                          }))
                          self.present(alert, animated: true)
                      }
                  case .failure(_):
                      print("fail")
                  }
              }
        }else{
            let alert = UIAlertController(title: "Empty Field!", message: "Please fill your email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                //action
            }))
            self.present(alert, animated: true)
        }
  
        
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        // Haptic
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        performSegue(withIdentifier: "BackSignUp", sender: nil)
    }
    
    
    //Validate
    func validate(emailverify: String, passwordverify: String, completion: @escaping (Result<Bool, Error>) -> ()){
        var cek = false
        let email = emailverify.trimmingCharacters(in: .whitespaces)
        let newEmailSafe = email.lowercased()
        let password = passwordverify
        
        let predicate = NSPredicate(format: "email == %@", newEmailSafe)
        let query = CKQuery(recordType: "Volunteer", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                print(record["email"]!)
                if( newEmailSafe == record["email"]! && password == record["password"]! ){
                    //Berhasil
                    print("Berhasil")
                    let defaults = UserDefaults.standard
                    defaults.set(newEmailSafe, forKey: "email")
                    defaults.set(true, forKey: "isLogin")
                    print("ini isLogin : \(defaults.bool(forKey: "isLogin"))")
                    VolunteerRecordID(recordID: record.recordID)
                    cek = true
                    completion(.success(cek))
                }else{
                    completion(.success(cek))
                    print("Salah")
                    
                }
                
            }
            
        }
    operation.queryCompletionBlock = {cursor, error in
        DispatchQueue.main.async {
            completion(.success(cek))
        }
    }
        
    
        publicdatabase.add(operation)
        
    }
    
    
    
}
