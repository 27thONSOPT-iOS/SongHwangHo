//
//  animationVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/11/07.
//

import UIKit

class animationVC: UIViewController {

    @IBOutlet weak var deathStarImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initiPosition(){
        // 132 ,211,150, 150
        deathStarImg.frame = CGRect(x: 132, y: 211, width: 150, height: 150)
    }
    @IBAction func startPressBtn(_ sender: Any) {
        //        UIView.animate(withDuration: 2.0, animations: {
        //            // frame, bounds, center, transform, alpha, backgroundcolor
        //            self.deathStarImg.alpha = 0
        //        })
        
        //        UIView.animate(withDuration: 2.0, animations: {
        //            self.deathStarImg.alpha = 0
        //            self.deathStarImg.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        //        }){ (finished) in UIView.animate(withDuration: 1.0, animations: {
        //            self.deathStarImg.alpha = 1
        //            self.initiPosition()
        //        })
        //        { {finished} in
        //            if finished {
        //                print("finished")
        //            }
        //        }
        //
        //        }
        //
        //    }
        
        // 오토가 잡혀있는 상황에서 변화를 주고 싶을 때
        //        UIView.animate(withDuration: 2.0, animations: {
        //            // 사이즈를 바꾸겠다
        //            self.deathStarImg.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
        //           // 현 위치에서 x좌표 100만큼 y 좌표 300만큼 움직이게
        //            self.deathStarImg.transform = CGAffineTransform(translationX: 100, y: 300)
        //           //  회전시키겠다.
        //            self.deathStarImg.transform = CGAffineTransform(rotationAngle: .pi/2)
        
        //        }
        
        // 이 모든 것을 한번에 변화를 주고 싶다면??
        let scale = CGAffineTransform(scaleX: 1.2, y: 1.5)
        let rotate = CGAffineTransform(rotationAngle: .pi)
        let move = CGAffineTransform(translationX: 20, y: 20)
        
        let combine = scale.concatenating(move).concatenating(rotate)
        // 오토가 잡혀있는 상황에서 변화를 주고 싶을 때
        UIView.animate(withDuration: 1.0, animations: {
            self.deathStarImg.transform = combine
        },completion: {(finish) in
            UIView.animate(withDuration: 1.0, animations: {
                self.deathStarImg.transform = .identity
            })
        })
    }
}

