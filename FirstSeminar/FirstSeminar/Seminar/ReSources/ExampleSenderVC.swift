//
//  ExampleSenderVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/10.
//

import UIKit

class ExampleSenderVC: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var autoRenewLabel: UILabel!
    @IBOutlet weak var renewLabel: UILabel!
    @IBOutlet weak var autoRenewTimeLabel: UILabel!
    
    var email : String?
    var autoUpdate : Bool?
    var updateInterval : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLable()
        // Do any additional setup after loading the view.
    }
    func setLable(){
        if let email = self.email, let autoUpdate = self.autoUpdate, let updateInterval = self.updateInterval{
            
            self.emailLabel.text = email
            self.emailLabel.sizeToFit()
            
            self.autoRenewLabel.text = autoUpdate ? "On" : "Off"
            self.autoRenewTimeLabel.text = "\(updateInterval)분"
        }
        
    }
    
    @IBAction func backPressBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
