//
//  DashboardViewController.swift
//  pruebaGoNet-BBVA
//
//  Created by Ricardo Gonzalez on 26/12/24.
//

import UIKit

class DashboardViewController: UIViewController {

    var manager = DataManager()
    var modelDashboard : ModelDashboard?
    
    @IBOutlet weak var imageDog: UIImageView!
    @IBOutlet weak var changeImage: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDogs()
        
        changeImage.layer.cornerRadius = 15
        logOutBtn.layer.cornerRadius = 15
    }


    @IBAction func changeImageAction(_ sender: UIButton) {
        getDogs()
    }
    
    @IBAction func logOutAction(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "userEmail")
        UserDefaults.standard.removeObject(forKey: "userPassword")
        
        dismiss(animated: true, completion: nil)
    }
   
    func getDogs() {
        let url = "https://dog.ceo/api/breeds/image/random"
        
        manager.fetchData(responseModel: ModelDashboard.self, path: url, method: .get) { [weak self] result in
            switch result {
            case .success(let model):
                //print(model)
                self?.modelDashboard = model
                self?.showDogs()
                
            case .failure(let fail):
                debugPrint(fail)
            }
        }
    }
    
    func showDogs() {
        let urlFake = "https://images.dog.ceo/breeds/chippiparai-indian/Indian-Chippiparai.jpg"
        imageDog.imageFromServerURL(urlString: modelDashboard?.message ?? urlFake)
    }
    
  
}

