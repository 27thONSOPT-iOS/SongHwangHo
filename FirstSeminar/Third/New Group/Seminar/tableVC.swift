//
//  tableVC.swift
//  FirstSeminar
//
//  Created by 송황호 on 2020/10/31.
//

import UIKit

class tableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var musicTableView: UITableView!
    var Musics : [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusic()
        musicTableView.dataSource = self
        musicTableView.delegate = self
    }

    func setMusic(){

        let data1 = Music(image: "juhyeok", num: 1, name: "이주혁", sub: "iOS 파트장 입니다")
        let data2 = Music(image: "saeeun", num: 2, name: "박세은", sub: "운영팀장 입니다")
        let data3 = Music(image: "junyeop", num: 3, name: "홍준엽", sub: "web 파트장 입니다")
        let data4 = Music(image: "peace", num: 4, name: "손평화", sub: "부회장 입니다")
        let data5 = Music(image: "hansol", num: 5, name: "김한솔", sub: "기획 파트장 입니다")
        let data6 = Music(image: "heesoo", num: 6, name: "유희수", sub: "총무 입니다")
        let data7 = Music(image: "minju", num: 7, name: "배민주", sub: "디자인 파트장 입니다")
        
        Musics = [data1, data2,data3,data4,data5,data6,data7]
    }
    
    // section별 행 몇 개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableVCCell.identifier) as? tableVCCell else {return UITableViewCell()}
        
        cell.setcell(music: Musics[indexPath.row].image, num: Musics[indexPath.row].num, name: Musics[indexPath.row].MusicNmae, sub: Musics[indexPath.row].sub)
        
        return cell
    }
    
}



// MARK: tableViewCell 관련 코드
class tableVCCell: UITableViewCell{
    
    static let identifier : String = "tableVCCell"
    
    @IBOutlet weak var MusicImg: UIImageView!
    @IBOutlet weak var musicNum: UILabel!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicSub: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setcell(music:String, num:Int, name:String, sub:String){
        MusicImg.image = UIImage(named: music)
        musicNum.text = "\(num)"
        musicName.text = name
        musicSub.text = sub
    }
    
}



// MARK: Information 관련 코드
struct Music{
    var image : String
    var num : Int
    var MusicNmae : String
    var sub : String
    
    init(image: String, num: Int, name:String, sub:String){
        self.image = image
        self.num = num
        self.MusicNmae = name
        self.sub = sub
    }
}
