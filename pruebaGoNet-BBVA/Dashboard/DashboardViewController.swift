//
//  DashboardViewController.swift
//  pruebaGoNet-BBVA
//
//  Created by Ricardo Gonzalez on 26/12/24.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var imageDog: UIImageView!
    @IBOutlet weak var changeImage: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeImage.layer.cornerRadius = 10
        logOutBtn.layer.cornerRadius = 10
    }


    @IBAction func changeImageAction(_ sender: UIButton) {
    }
    
    @IBAction func logOutAction(_ sender: UIButton) {
    }
    

}
