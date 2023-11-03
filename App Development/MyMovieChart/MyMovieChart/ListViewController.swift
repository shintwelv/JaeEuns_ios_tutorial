//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by siheo on 11/3/23.
//

import UIKit

class ListViewController: UITableViewController {
    
    lazy var list: [MovieVO] = {
        var datalist: [MovieVO] = []
        return datalist
    }()
    
    override func viewDidLoad() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        let apiData = try! Data(contentsOf: apiURI)
        
        // json 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                
                self.list.append(mvo)
            }
        } catch {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! MovieCell
        
        cell.title.text = row.title
        cell.desc.text = row.description
        cell.opendate.text = row.opendate
        cell.rating.text = "\(row.rating!)"
        
        // 섬네일 경로를 인자값으로 하는 URL 객체 생성
        let url: URL! = URL(string: row.thumbnail!)
        
        // 이미지를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        // UIImage 객체를 생성하여 아울렛 변수의 image 속성에 대입
        cell.thumbnail.image = UIImage(data: imageData)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row)번째 행입니다")
    }
}
