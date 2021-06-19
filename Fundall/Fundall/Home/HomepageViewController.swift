//
//  HomepageViewController.swift
//  Fundall
//
//  Created by apple on 14/06/2021.
//

import UIKit

class HomepageViewController: UIViewController {
    @IBOutlet weak var homeAvatar: UIImageView!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var amountSpent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func dashboardPressed(_ sender: UIButton) {
    }
    
}
