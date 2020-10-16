//
//  HomeVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/15.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(set), name: .init("setLog"), object: nil)
    }
    
    @objc func set(_ notification: Notification) {
        
        guard let userinfo = notification.userInfo as? [String: Any] else  {return }
        
        guard let id = userinfo["ID"] as? String else {return }
        guard let name = userinfo["Name"] as? String else {return }
        
        
        if id == "" || name == "" {
            self.partLabel.text = id
            self.nameLabel.text = "누구냐 넌..."
        }else{
            
            self.partLabel.text = id
            self.nameLabel.text = "\(name)님 안녕하세요!"
        }
        
    }
    
    
    
    @IBAction func loginPressBtn(_ sender: Any) {
        guard let NVC = self.storyboard?.instantiateViewController(identifier: "LoginNVC") as? LoginNVC else{return }
    
        NVC.modalPresentationStyle = .fullScreen
        self.present(NVC, animated: true, completion: nil)
    }

}
