//
//  ViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 02.09.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        
        passwordTF.delegate = self
        
        currentUser = User.getUserDate()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            
            // Если пользователь нажал "Готово" на userNameTF, перейдите к passwordTF
            
            passwordTF.becomeFirstResponder()
            
        } else if textField == passwordTF {
            
            // Если пользователь нажал "Готово" на passwordTF, скройте клавиатуру
            
            textField.resignFirstResponder()
            
            // Вы можете также вызвать ваш метод logInAction здесь, если хотите, чтобы при нажатии "Готово" на passwordTF выполнялась авторизация.
            
            performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
        return true
    }
    
    
    
    
    
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    private let user = User.getUserDate()
    
    @IBAction func logInActio(_ sender: Any) {
        
        guard let currentUser = currentUser else {
            print("No current user data")
            return
        }
        
        guard
            userNameTF.text == currentUser.userName,
            passwordTF.text == currentUser.password
        else {
            // Выводите сообщение об ошибке, если имя пользователя или пароль неверны
            let alertController = UIAlertController(title: "Error", message: "The username or password is incorrect", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            alertController.addAction(UIAlertAction(title: "Create an account", style: .default) { _ in
                self.performSegue(withIdentifier: "crateANewAcc", sender: nil)
                print("Create an account")
            })
            
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Если имя пользователя и пароль верны, перейдите на следующий экран
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    @IBAction func craetaActionAcc(_ sender: Any) {
        performSegue(withIdentifier: "crateANewAcc", sender: nil)
        
    }
}

