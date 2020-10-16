//
//  ViewController.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wangwang: UILabel!
    @IBOutlet weak var clickBtn: UIButton!
    
    var isclick : Bool = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wangwang.isHidden = true
    }
    
    @IBAction func clickAction(_ sender: Any) {
        
        if isclick == false{
            wangwang.isHidden = false
            
            wangwang.sizeToFit()            // 사이즈에 맞게 바꿔주기
            wangwang.text = "눌렀다~ 나타났다"
            isclick = true
        }else{
            wangwang.isHidden = true
            isclick = false
        }
        
    }
    @IBAction func cloickBlueVtn(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {return }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}

