//
//  ViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 02.09.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        
        passwordTF.delegate = self
        
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
        
        guard
            userNameTF.text == user.userName, //имя
            passwordTF.text == user.password //пароль
        else {
            // Создаем UIAlertController
            let alertController = UIAlertController(title: "Error", message: "The username or password is incorrect", preferredStyle: .alert)
            
            // Добавляем действие (кнопку) к UIAlertController
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            
            alertController.addAction(UIAlertAction(title: "Create an account", style: .default) { _ in
                
                self.performSegue(withIdentifier: "crateANewAcc", sender: nil)
                
                print("Creat an account")
                
            })
            
            
            // Показываем UIAlertController
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        performSegue(withIdentifier: "loginSegue", sender: nil)
        
    }
    @IBAction func craetaActionAcc(_ sender: Any) {
        performSegue(withIdentifier: "crateANewAcc", sender: nil)
        
    }
}

