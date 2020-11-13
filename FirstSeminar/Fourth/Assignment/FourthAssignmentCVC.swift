//
//  ThirdAssignmentVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/11/07.
//

import UIKit

class FourthAssignmentCVC: UIViewController  {

    @IBOutlet weak var ProfilCollection: UICollectionView!
    
    
    var informations : [information] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setdata()
        ProfilCollection.dataSource = self
        ProfilCollection.delegate = self
        ProfilCollection.collectionViewLayout = UICollectionViewFlowLayout()
        setupCollectionViewLayout()
    }
    
    func setupCollectionViewLayout() {
        let layout = ProfilCollection.collectionViewLayout as? UICollectionViewFlowLayout
        // collectionView header 고정!
        layout?.sectionHeadersPinToVisibleBounds = true
         }
    
    // 데이터 값들 만들기
    func setdata(){
        let data1 = information(image: "juhyeok", name: "주혁", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data2 = information(image: "hansol", name: "한솔", subtitle: "#고객중심#고객행동데이터기\n" + "반한#UX디자이너#워너비,,")
        let data3 = information(image: "heesoo", name: "희수", subtitle: "#총무꿈나무 #유총무 #현재_\n" + "소식중 #풉")
        let data4 = information(image: "junyeop", name: "준엽", subtitle: "#26기서버 #27기웹 #샵이_두\n" + "개면_어떻게될까? ##")
        let data5 = information(image: "minguru", name: "민구", subtitle: "#밍맹 #안팟장 #이래뵈도_귀\n" + "여운거좋아함 #지박령 #허당")
        let data6 = information(image: "minju", name: "민주", subtitle: "#디팟장 #개자이너 #최종목표\n" + "는행복")
        let data7 = information(image: "nayeon", name: "나연", subtitle: "#이제막학기 #여러분들이랑_\n" + "친해지고_싶어요 #번개스터디환영")
        let data8 = information(image: "peace", name: "평화", subtitle: "#핸드피쓰 #이너피쓰 #배꼽도\n" + "둑 #헬린이 #sson_peace7")
        let data9 = information(image: "yeonjeong", name: "정연", subtitle: "##플레이스픽 #ENFJ #기획_디\n" + "자인_개발_다")
        let data10 = information(image: "saeeun", name: "세은", subtitle: "#마 #아요는 #처음입니다")
        
        informations = [data1,data2,data3, data4, data5,data6,data7, data8, data9, data10]
    }
}


extension FourthAssignmentCVC:UICollectionViewDataSource{
    // section 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return informations.count + 1
//        return informations.count+1// 첫 cell은 sopt+Networking 이므로 더하기 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell1 = ProfilCollection.dequeueReusableCell(withReuseIdentifier: ThirdCell1CVCell.identifier, for: indexPath) as? ThirdCell1CVCell else { return UICollectionViewCell() }
        
        guard let cell2 = ProfilCollection.dequeueReusableCell(withReuseIdentifier: ThirdCell2CVCell.identifier, for: indexPath) as? ThirdCell2CVCell else {return UICollectionViewCell() }
        
        if indexPath.row == 0{
            return cell1
        }else{
            cell2.setinformation(image: informations[indexPath.row-1].image, name: informations[indexPath.row-1].name, subtitle: informations[indexPath.row-1].subtitle)
            return cell2
        }
    }
    
    // 헤더 넣기
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerview = ProfilCollection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header1CVCell.identifier, for: indexPath) as! header1CVCell

        return headerview
    }
    
    // collectionview headercell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = view.frame.size.width
        let height: CGFloat = 88
        
        // 스크롤 될 때 여기서 size 조정하면 되겠다!!!
        return CGSize(width: width, height: height)
    }
    
}

extension FourthAssignmentCVC : UICollectionViewDelegate{
    
    
}

extension FourthAssignmentCVC : UICollectionViewDelegateFlowLayout{
    
    // cell 가로 세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item > 0 {
            return CGSize(width: (view.frame.size.width/2) , height: 225)
        }else{
            return CGSize(width: (view.frame.size.width) , height: 420)
        }
    }
    // cell 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // cell 좌,우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // collectionview contentsInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}




