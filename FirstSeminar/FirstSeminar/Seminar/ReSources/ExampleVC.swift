//
//  ExampleVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/10.
//

import UIKit

class ExampleVC: UIViewController {

    
    @IBOutlet weak var emailTx: UITextField!
    @IBOutlet weak var renewLabel: UILabel!
    @IBOutlet weak var renewTimeLabel: UILabel!
    @IBOutlet weak var swichBtn: UISwitch!
    @IBOutlet weak var stepperBtn: UIStepper!
    
    var email : String?
    var AutoUpdate : Bool?
    var updateInterval : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        email = emailTx.text
    }
    
    @IBAction func swichPressBtn(_ sender: Any) {
        if swichBtn.isOn == true {
            renewLabel.text = "자동 갱신"
            AutoUpdate = true
        }else{
            renewLabel.text = "수동 갱신"
            AutoUpdate = false
        }
    }
    
    @IBAction func stepperPressBtn(_ sender: UIStepper) {
        renewTimeLabel.text = "\(Int(sender.value))분 마다"
        updateInterval = Int(sender.value)
    }
    
    @IBAction func nextPressBtn(_ sender: Any) {
        guard let reciveVC = self.storyboard?.instantiateViewController(identifier: "ExampleSenderVC") as? ExampleSenderVC  else {return }
        
        reciveVC.email = self.emailTx.text
        reciveVC.autoUpdate = self.swichBtn.isOn
        reciveVC.updateInterval = Int(self.stepperBtn.value)
        
        reciveVC.modalPresentationStyle = .fullScreen
        
        present(reciveVC, animated: true, completion: nil)
    }
    
}
