//
//  CrateAccViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 05.09.2023.
//

import UIKit

class CrateAccViewController: UIViewController {
    
    @IBOutlet weak var passwordNewTF: UITextField!
    
    @IBOutlet weak var nameNewTF: UITextField!
    
    @IBOutlet weak var buttunGo: UIButton!
    
    var enteredNewUserName: String?
    
    var enteredNewPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttunGo.layer.cornerRadius = 13
        
    }
    
    
    
    @IBAction func logInActio(_ sender: Any) {
        enteredNewUserName = nameNewTF.text
        enteredNewPassword = passwordNewTF.text
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "YourSegueIdentifier" {
            if let finalCNAViewController = segue.destination as? FinalCNAViewController {
                // Устанавливаем значения userNameNewACC и passwordNewACC
                finalCNAViewController.userNameNewACC = nameNewTF.text ?? ""
                finalCNAViewController.passwordNewACC = passwordNewTF.text ?? ""
            }
        }
    }
    
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
        
        
        
    }
    
    
    
    
    
}


