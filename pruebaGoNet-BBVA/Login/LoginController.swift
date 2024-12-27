//
//  ViewController.swift
//  pruebaGoNet-BBVA
//
//  Created by Ricardo Gonzalez on 26/12/24.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginBtn.layer.cornerRadius = 15
    }

    
    
    
    @IBAction func LoginBtnAction(_ sender: UIButton) {
        let newViewController = DashboardViewController()
        present(newViewController, animated: true, completion: nil)
    }
    
    

}

