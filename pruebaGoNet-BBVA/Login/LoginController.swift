//
//  ViewController.swift
//  pruebaGoNet-BBVA
//
//  Created by Ricardo Gonzalez on 26/12/24.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    //var manager = DataManager()
    let userDefaults = UserDefaults.standard
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerBtn.layer.cornerRadius = 15
        loginBtn.layer.cornerRadius = 15
        
          if let storedEmail = UserDefaults.standard.string(forKey: "userEmail"),
           let storedPassword = UserDefaults.standard.string(forKey: "userPassword") {
            presentNewVC()  // Navegar a la siguiente vista
        }
    }
    
    
    
    
    @IBAction func RegisterBtnAction(_ sender: UIButton) {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
            
        if email.isEmpty || password.isEmpty {
            showAlert(titulo: "Campos Vacíos", mensaje: "Por favor, ingresa un email y contraseña.")
        } else {
            showAlertConfirm(email: emailTF.text ?? "", password: passwordTF.text ?? "")
            UserDefaults.standard.set(email, forKey: "userEmail")
            UserDefaults.standard.set(password, forKey: "userPassword")
            
        }
    }
    
    @IBAction func LoginBtnAction(_ sender: UIButton) {
            let email = emailTF.text ?? ""
            let password = passwordTF.text ?? ""
        
           if email.isEmpty || password.isEmpty {
              showAlert(titulo: "Error", mensaje: "Es necesario ingresar sus datos")
          }
        
            
            if let storedEmail = UserDefaults.standard.string(forKey: "userEmail"),
                let storedPassword = UserDefaults.standard.string(forKey: "userPassword") {
                
                if storedEmail == email && storedPassword == password {
                    presentNewVC()
                } else {
                    showAlert(titulo: "Error", mensaje: "Credenciales inválidas")
                }
            }
        
            self.emailTF.text = ""
            self.passwordTF.text = ""
    }
    
         func showAlertConfirm(email: String, password: String) {
            let alerta = UIAlertController(
                title: "Confirmar",
                message: "¿Los datos son correctos?\n\nEmail: \(email)\nPassword: \(password)",
                preferredStyle: .alert
            )
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            alerta.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { _ in
                
                self.registerBtn.isHidden = true
            }))
            present(alerta, animated: true, completion: nil)
        }
   
    
        func showAlert(titulo: String, mensaje: String) {
            let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
            let accionAceptar = UIAlertAction(title: "Ok", style: .default) { _ in
                
            }
            alerta.addAction(accionAceptar)
            present(alerta, animated: true)
        }
        
        func presentNewVC() {
            let newViewController = DashboardViewController()
            present(newViewController, animated: true, completion: nil)
            
        }
        
        
    }
    
