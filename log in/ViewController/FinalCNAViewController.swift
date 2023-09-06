//
//  FinalCNAViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 06.09.2023.
//

import UIKit

class FinalCNAViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: VAR AND LET
    
    var passwordSecond = ""
    
    var loginSecondary = ""
    
    //MARK: IBOutlet
    
    @IBOutlet weak var finalPasswordTF: UITextField!
    
    @IBOutlet weak var finalNameTF: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        finalNameTF.delegate = self
        
        finalPasswordTF.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == finalNameTF {
            
            print("The user clicked on the final screen next")
            
            finalPasswordTF.becomeFirstResponder()
            
        } else if textField == finalPasswordTF {
            
            print("The user clicked on the final done screen")
            
            textField.resignFirstResponder()
            
        }
        
        return true
    }
    
    
    @IBAction func goTapedButtonFinalAction(_ sender: Any) {
        
        if !passwordSecond.isEmpty && !loginSecondary.isEmpty {
            
            print("Passwords are not empty")
            
            if finalNameTF.text == loginSecondary && finalPasswordTF.text == passwordSecond {
                
                print("Passwords match")
                
                performSegue(withIdentifier: "goToLogIn", sender: nil)
                
                print("The user went to the main screen")
                
                let newPerson = Person(name: "\(loginSecondary)", surname: "\(loginSecondary)")
                
                let newUser = User(userName: "\(loginSecondary)", password: "\(passwordSecond)", person: newPerson)
                
                var users = [User.getUserDate()]
                
                users.append(newUser)
                
                print("The user is registered !")
                
                
            } else {
                let alertController = UIAlertController(title: "Error", message: "You didn't enter anything", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
                print("Passwords or name are incorrect ")
                
                return
            }
            
        } else {
            
            let alertController = UIAlertController(title: "Error", message: "You didn't enter anything", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            print("Password or Name is empty")
            return
        }
        
    }
    
    
    
    
    
    
}
