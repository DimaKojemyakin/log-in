//
//  CrateAccViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 05.09.2023.
//

import UIKit

class CrateAccViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: IBOutlets
    @IBOutlet var passwordSecond: UILabel!
    @IBOutlet var loginSecondary: UILabel!
    
    @IBOutlet weak var passwordNewTF: UITextField!
    
    @IBOutlet weak var nameNewTF: UITextField!
    
    @IBOutlet weak var buttunGo: UIButton!
    
    var enteredNewUserName: String?
    
    var enteredNewPassword: String?
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordNewTF.delegate = self
        
        nameNewTF.delegate = self
        
        buttunGo.layer.cornerRadius = 13
        
    }
    
    //MARK: textFilsShouldReturn
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameNewTF {
            
            print("The user clicked on the final screen next")
            
            passwordNewTF.becomeFirstResponder()
            
        } else if textField == passwordNewTF {
            
            print("The user clicked on the final done screen")
            
            textField.resignFirstResponder()
            
        }
        return true
    }
    
    //MARK: GO Button
    
    @IBAction func buttunTapedNewAccGo(_ sender: Any) {
        
        guard
            
            let name = nameNewTF.text, !name.isEmpty,
            
            let password = passwordNewTF.text, !password.isEmpty
                
        else {
            
            print("Password or Name is empty")
            
            let alertController = UIAlertController(title: "Error", message: "You didn't enter anything", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        print("Name or Password isn't empty")
        
        performSegue(withIdentifier: "seguaNewAccGo", sender: nil)
        
        return
        
    }
    
    //MARK: Data transmission
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "seguaNewAccGo" else { return }
        
        guard let destination = segue.destination as? FinalCNAViewController else { return }
        
        destination.passwordSecond = passwordNewTF.text ?? ""
        
        destination.loginSecondary = nameNewTF.text ?? ""
        
        print("We have passed the passwords")
        
    }
    
    
    
    
    
    
    
    
    
}


