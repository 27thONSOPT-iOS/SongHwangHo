//
//  customTBC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/11/07.
//

import UIKit

class customTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabs()
        // Do any additional setup after loading the view.
    }

    func setTabs(){
        guard let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "purpleVC") as? purpleVC else {return }
        
        guard let yellowVC = self.storyboard?.instantiateViewController(withIdentifier: "yellowVC") as? yellowVC else {return }
        
        purpleVC.tabBarItem.image = UIImage(systemName: "house")
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        purpleVC.tabBarItem.title = "Home"
        
        yellowVC.tabBarItem.image = UIImage(systemName: "person")
        yellowVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        yellowVC.tabBarItem.title = "Profile"
        
        setViewControllers([purpleVC, yellowVC], animated: true)
    }
}
