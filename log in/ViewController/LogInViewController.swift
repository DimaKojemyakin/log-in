//
//  ViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 02.09.2023.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    private let user = User.getUserDate()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func logInActio(_ sender: Any) {
        
//        guard
//            userNameTF.text == user.userName
//            passwordTF.text == user.password
//        else {
//            showAlert
//        }
            
        
    }
}

