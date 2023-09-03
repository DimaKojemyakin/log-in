//
//  AboutMeViewController.swift
//  log in
//
//  Created by Дима Кожемякин on 03.09.2023.
//

import UIKit

class AboutMeViewController: UIViewController {
    private let user = User.getUserDate()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(user.person.fullname)"
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
