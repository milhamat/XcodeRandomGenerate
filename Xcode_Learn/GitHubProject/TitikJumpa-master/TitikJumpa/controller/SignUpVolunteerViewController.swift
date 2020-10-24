//
//  SignUpVolunteerViewController.swift
//  TitikJumpa
//
//  Created by Franky Chainoor Johari on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CloudKit

class SignUpVolunteerViewController: UIViewController {

    let publicdatabase = CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase
    
    @IBOutlet weak var namaField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        namaField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        phoneField.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        confirmPasswordField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
       
    }
    

    @IBAction func signUpBtn(_ sender: Any) {
        // Haptic
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        var checker = false
        
        
        if namaField.text?.isEmpty == false && emailField.text?.isEmpty == false && phoneField.text?.isEmpty == false && passwordField.text?.isEmpty ==  false && confirmPasswordField.text?.isEmpty == false{
            if emailField.text?.isValid(String.ValidityType.email) ?? false{
                if(phoneField.text?.isValid(String.ValidityType.nohp) ?? false){
                    if(passwordField.text == confirmPasswordField.text){
                        checker = true
                    }else{
                        let alert = UIAlertController(title: "Fail Sign Up", message: "Your Password isn't match with Confirm Password.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                            self.passwordField.text = ""
                            self.confirmPasswordField.text = ""
                        }))
                        self.present(alert, animated: true)
                    }
                }else{
                    let alert = UIAlertController(title: "Phone number not valid", message: "Please fill up your phone number correctly", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                        //action
                    }))
                    self.present(alert, animated: true)                }
            }else{
                let alert = UIAlertController(title: "Email not valid", message: "Please fill up your email corretly", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    //action
                }))
                self.present(alert, animated: true)
            }
            
        
        }else{
            let alert = UIAlertController(title: "Empty Field!", message: "Please fill up your information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                //action
            }))
            self.present(alert, animated: true)
        }
        
        
        if(checker){
        fetchData(email: emailField.text!){(result) in
            switch result{
            case .success(let cek):
                print(cek)
                if cek == true {
                    print("true")
                    let alert = UIAlertController(title: "Fail Sign Up", message: "Your email is already registered.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        self.namaField.text = ""
                        self.emailField.text = ""
                        self.phoneField.text = ""
                        self.passwordField.text = ""
                        self.confirmPasswordField.text = ""
                    }))
                    self.present(alert, animated: true)
                }else{
                    self.savedata(name: self.namaField.text!, email: self.emailField.text!, phone: self.phoneField.text!, password: self.passwordField.text!)
                    let defaults = UserDefaults.standard
                    defaults.set(self.emailField.text, forKey: "email")
                    defaults.set(true, forKey: "isLogin")
                    let alert = UIAlertController(title: "Success Sign Up", message: "Your account is success registered.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        self.performSegue(withIdentifier: "successSignUp", sender: nil)
                    }))
                    self.present(alert, animated: true)
                }
                
            case .failure(_):
                print("fail")
                }
            }
        }
        
        
    }
    
    @IBAction func SignInBtn(_ sender: Any) {
        // Haptic
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        performSegue(withIdentifier: "BackSignIn", sender: nil)
    }
    
    
    
    
    func savedata(name: String, email: String, phone: String, password: String) {
        let newEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let newEmailSafe = newEmail.lowercased()
        let volunteers = Volunteer(recordID: CKRecord.ID(), name: name, email: newEmailSafe, phone: phone, points: 0, role: 0, communityID: 1, password: password)
        let record = CKRecord(recordType: "Volunteer")
        print(volunteers.name)
        print(volunteers.email)
        record.setValue(volunteers.name, forKey: "name")
        record.setValue(volunteers.email, forKey: "email")
        record.setValue(volunteers.phone, forKey: "phone")
        record.setValue(volunteers.points, forKey: "point")
        record.setValue(volunteers.role, forKey: "role")
        //record.setValue(volunteers.avatar, forKey: "avatar")
        record.setValue(volunteers.communityID, forKey: "communityID")
        record.setValue(volunteers.password, forKey: "password")
        publicdatabase.save(record) { (savedRecord, error) in
            if error == nil{
                print("Record Saved")
            }else{
                print("Record Not Saved")
            }
        }
        
    }
    
    
    func fetchData(email: String, completion: @escaping (Result<Bool, Error>) -> ()){
        var cek = false
        let predicate = NSPredicate(format: "email == %@", email)
        let query = CKQuery(recordType: "Volunteer", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                print(record["email"]!)
                if(email == record["email"]){
                    cek = true
                    completion(.success(cek))
                }else{
                    completion(.success(cek))
                }
                
            }
        }
        operation.queryCompletionBlock = {cursor, error in
            DispatchQueue.main.async {
                completion(.success(cek))
                print("test")
            }

        }
        publicdatabase.add(operation)
        
    }


}

extension String{
    enum ValidityType{
        case email
        case nohp
    }
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-0.-]+\\.[A-Za-z]{2,64}"
        case nohp = "[0-9]{10,26}"
    }
    
    func isValid(_ ValidityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        switch ValidityType {
        case .email:
            regex = Regex.email.rawValue
        case .nohp:
            regex = Regex.nohp.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
