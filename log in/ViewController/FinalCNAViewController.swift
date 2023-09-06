//
//  FinalCNAViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 06.09.2023.
//

import UIKit

class FinalCNAViewController: UIViewController {
    
    var userNameNewACC: String = ""
    var passwordNewACC: String = ""
    
    @IBOutlet weak var finalPasswordTF: UITextField!
    @IBOutlet weak var finalNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    @IBAction func goTapedButtonFinalAction(_ sender: Any) {
        print("Hello")
        // Проверяем, что userNameNewACC и passwordNewACC не пустые
        if !userNameNewACC.isEmpty && !passwordNewACC.isEmpty {
            print("\(userNameNewACC) \(passwordNewACC)")
            // Проверяем, соответствуют ли введенные значения userNameNewACC и passwordNewACC введенным значениям в текстовых полях
            if userNameNewACC == finalNameTF.text && passwordNewACC == finalPasswordTF.text {
                // Если условия соблюдены, выполняйте переход
                let vc = LogInViewController()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                // Если не совпадают, показываем ошибку и не выполняем переход
                let alertController = UIAlertController(title: "Error", message: "The username or password is incorrect", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }))
                
                present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    
    
    
}
