//
//  FourthAssignmentLoginVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/11/13.
//

import UIKit

class FourthAssignmentLoginVC: UIViewController {

    static let identifier = "FourthAssignmentLoginVC"
    
    @IBOutlet weak var partTx: UILabel!
    @IBOutlet weak var nameTx: UILabel!
    
    var part : String?
    var name : String?
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(sets), name: .init("log"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @objc func sets(_ notification: Notification) {
        
        guard let userinfo = notification.userInfo as? [String: Any] else  {return }
        
        guard let id = userinfo["ID"] as? String else {return }
        guard let name = userinfo["Name"] as? String else {return }
        
        
        if id == "" || name == "" {
            self.partTx.text = "어디서 온"
            self.nameTx.text = "누구냐 넌..."
        }else{
            
            self.partTx.text = id
            self.nameTx.text = "\(name)님"
        }
        
    }
    
    @IBAction func loginPressBtn(_ sender: Any) {
        guard let VC = storyboard?.instantiateViewController(withIdentifier: FourthAssignNVC.identifier) as? FourthAssignNVC else { return }
        
        VC.modalPresentationStyle = .fullScreen
        
        self.present(VC, animated: true, completion: nil)
    }
}


// MARK: Login view 관련 코드
class FourthAssignLoginNVC : UIViewController, UITextFieldDelegate{
    static let identifier = "FourthAssignLoginNVC"
    
    @IBOutlet weak var partTxFiled: UITextField!
    @IBOutlet weak var nameTxFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partTxFiled.delegate = self
        nameTxFiled.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func keyboardWillShow(_ sender: Notification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
        }
    
    @objc func keyboardWillHide(_ sender: Notification) {
    self.view.frame.origin.y = 0 // Move view to original position
    }

    @IBAction func loginPressBtn(_ sender: Any) {
        
        NotificationCenter.default.post(name: .init("log"), object: nil, userInfo: ["ID" :self.partTxFiled.text!, "Name": self.nameTxFiled.text!])

        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: Navigation Controller
class FourthAssignNVC :UINavigationController{
    static let identifier = "FourthAssignNVC"
}


