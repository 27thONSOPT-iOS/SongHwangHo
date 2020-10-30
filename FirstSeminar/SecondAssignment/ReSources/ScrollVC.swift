//
//  ScrollVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/30.
//

import UIKit

class ScrollVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var topBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBtn.isHidden = true
        scroll.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        // yPosition이 음수, 즉 위로 스크롤을 하는 경우는 헤더 뷰의 height을 올려
        if yPosition > 300 { // yPosition이 음수, 즉 위로 스크롤을 하는 경우
            topBtn.isHidden = false
            
        }else{ // 아래로 스크롤시
            topBtn.isHidden = true
        }
    }
    
    
    @IBAction func topScrollPressBtn(_ sender: Any) {
        scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    


}
