//
//  HomeViewController.swift
//  Registration And Login API
//
//  Created by Mac on 09/06/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //CREATING OULET
    @IBOutlet weak var nameLabel: UILabel!
    var strName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = strName
        navigationController?.setNavigationBarHidden(false, animated: true)
       // navigationController?.navigationBar.barTintColor = .green

        // Do any additional setup after loading the view.
    }
    
    // ACTION PERFORMED BY PRESSING LOGOUT BUTTON
    @IBAction func onLogOutBtn(_ sender: Any)
    {
        APIManager.shareInstance.callingLogOutAPI(vc: self)
       
    }
    
}
extension HomeViewController {
 static func sharInstance()-> HomeViewController{
return HomeViewController.instantiateFromStoryboard("Home")
}
}
