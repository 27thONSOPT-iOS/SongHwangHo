//
//  ThirdAssignmentVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/11/07.
//

import UIKit

class ThirdAssignmentVC: UIViewController  {

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
        let data2 = information(image: "hansol", name: "한솔", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data3 = information(image: "heesoo", name: "희수", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data4 = information(image: "junyeop", name: "준엽", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data5 = information(image: "minguru", name: "민구", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data6 = information(image: "minju", name: "민주", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data7 = information(image: "nayeon", name: "나연", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        let data8 = information(image: "peace", name: "평화", subtitle: "#hereis#아요#내꿈은\n" + "#사과농장#ENFP")
        
        informations = [data1,data2,data3, data4, data5,data6,data7, data8]
    }
}


extension ThirdAssignmentVC:UICollectionViewDataSource{
    // section 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return informations.count
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
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 88
        
        // 스크롤 될 때 여기서 size 조정하면 되겠다!!!
        return CGSize(width: width, height: height)
    }
    
}

extension ThirdAssignmentVC : UICollectionViewDelegate{
    
    
}

extension ThirdAssignmentVC : UICollectionViewDelegateFlowLayout{
    
    // cell 가로 세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item > 0 {
            return CGSize(width: (view.frame.size.width/2)-2 , height: 225)
        }else{
            return CGSize(width: view.frame.size.width , height: 420)
        }
    }
    // cell 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // cell 좌,우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    // collectionview contentsInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}




// MARK: 헤더 관련 cell
class header1CVCell : UICollectionReusableView{
    static let identifier : String = "header1CVCell"
}

// MARK: sopt NetWorking 관련 cell
class ThirdCell1CVCell : UICollectionViewCell{
    static let identifier : String = "ThirdCell1CVCell"
    
}

// MARK: profile 관련 cell
class ThirdCell2CVCell : UICollectionViewCell{
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var nameTx: UILabel!
    @IBOutlet weak var subtitleTx: UILabel!
    
    static let identifier : String  = "ThirdCell2CVCell"
    
    
    func setinformation(image : String, name : String, subtitle: String) {
        profile.image = UIImage(named: image)
        nameTx.text = name
        subtitleTx.text = subtitle
    }
}


// 데이터 structure
struct information{
    let name: String
    let image : String
    let subtitle : String
    
    init(image:String , name:String, subtitle: String){
        self.image = image
        self.name = name
        self.subtitle = subtitle
    }
}
