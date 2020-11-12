//
//  aaaVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/11/12.
//

import UIKit

class aaaVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private var collectionview : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width/2-2, height: view.frame.size.height/2-2)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        collectionview = UICollectionView(frame: .zero  , collectionViewLayout: layout)
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.register(LogoCell.self, forCellWithReuseIdentifier: LogoCell.identifier)
    
        guard let collectionview  = collectionview else {return}
        
        view.addSubview(collectionview)
        collectionview.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell1 = collectionview?.dequeueReusableCell(withReuseIdentifier: LogoCell.identifier, for: indexPath) as? LogoCell else {return UICollectionViewCell()}
        
        cell1.configure(with: UIImage(named: "banner"))
        return cell1
    }

}

// 첫번째 Cell
class LogoCell : UICollectionViewCell {
    static let identifier = "LogoCell"
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with image: UIImage?){
        imageView.image = image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
