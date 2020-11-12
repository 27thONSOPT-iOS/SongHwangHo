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
    
    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfilCollection.dataSource = self
        ProfilCollection.delegate = self
        setupCollectionViewLayout()
    }
    
    func setupCollectionViewLayout() {
        let layout = ProfilCollection.collectionViewLayout as? UICollectionViewFlowLayout
        // collectionView header 고정!
        layout?.sectionHeadersPinToVisibleBounds = true
         }
    
//    // 데이터 값들 만들기
//    func setdata(){
//        let data1 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//        let data2 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//        let data3 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//        let data4 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//        let data5 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//        let data6 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//        let data7 = information(image: <#T##String#>, name: <#T##String#>, subtitle: <#T##String#>)
//
//        informations = [data1,data2,data3, data4, data4,data5,data6,data7]
//    }
}


extension ThirdAssignmentVC:UICollectionViewDataSource{
    // section 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
//        return informations.count+1// 첫 cell은 sopt+Networking 이므로 더하기 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell1 = ProfilCollection.dequeueReusableCell(withReuseIdentifier: ThirdCell1CVCell.identifier, for: indexPath) as? ThirdCell1CVCell else { return UICollectionViewCell() }
        
        guard let cell2 = ProfilCollection.dequeueReusableCell(withReuseIdentifier: ThirdCell2CVCell.identifier, for: indexPath) as? ThirdCell2CVCell else {return UICollectionViewCell() }
        
        if indexPath.row == 0{
            return cell1
        }else{
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
        return CGSize(width: width, height: height)
    }
    
}

extension ThirdAssignmentVC : UICollectionViewDelegate{
    
    
}

extension ThirdAssignmentVC : UICollectionViewDelegateFlowLayout{
    
    // cell 가로 세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item > 0 {
        return CGSize(width: 150 , height: 225)
        }else{
            return CGSize(width: 375 , height: 420)
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
    
    static let identifier : String  = "ThirdCell2CVCell"
}


// 데이터 structure
struct information{
    let name: String?
    let image : String?
    let subtitle : String?
    
    init(image:String , name:String, subtitle: String){
        self.image = image
        self.name = name
        self.subtitle = subtitle
    }
}
