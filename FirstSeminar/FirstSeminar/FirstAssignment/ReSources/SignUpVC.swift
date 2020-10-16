//
//  SignUpVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/15.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinPressBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
