//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by ShinIl Heo on 11/4/23.
//

import UIKit

class TheaterListController: UITableViewController {
    
    var list: [NSDictionary] = []
    
    var startPoint = 0
    
    override func viewDidLoad() {
        self.callTheatherAPI()
    }
    
    func callTheatherAPI() -> Void {
        let requestAPI = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100 //불러올 데이터 개수
        let type = "json" //데이터 형식
        
        let urlObj = URL(string: "\(requestAPI)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            let stringdata = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422) //EUC_KR
            
            let encdata = stringdata.data(using: String.Encoding.utf8.rawValue)
            
            do {
                let apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                
                for obj in apiArray! {
                    self.list.append(obj as! NSDictionary)
                }
            } catch {
                let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert, animated: false)
            }
            
            self.startPoint += sList
        } catch {
            let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as! TheaterCell
        
        cell.name.text = obj["상영관명"] as? String
        cell.tel.text = obj["연락처"] as? String
        cell.addr.text = obj["소재지도로명주소"] as? String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_map" {
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            
            let data = self.list[path!.row]
            
            (segue.destination as? TheaterViewController)?.param = data
        }
    }
}
