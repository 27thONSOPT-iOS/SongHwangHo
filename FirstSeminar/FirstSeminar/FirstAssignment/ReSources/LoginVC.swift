//
//  LoginVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/15.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var partLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginPressBackBtn(_ sender: Any) {
        NotificationCenter.default.post(name: .init("setLog"), object: nil, userInfo: ["ID" :self.partLabel.text!, "Name": self.nameLabel.text!])
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signinPressBtn(_ sender: Any) {
        guard let signinVC = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else {return }
        
        self.navigationController?.pushViewController(signinVC, animated: true)
    }
    
}
