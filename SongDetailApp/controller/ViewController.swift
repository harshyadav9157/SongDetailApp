//
//  ViewController.swift
//  SongDetailApp
//
//  Created by harsh yadav on 10/05/21.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    var arrData = [jsonModel]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
             guard let data = data else {return}
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                for mainArr in results.arrayValue{
                    self.arrData.append(jsonModel(json: mainArr))
                }
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }

            }catch{
                print(error.localizedDescription)
            }
        }.resume() //start task
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstVc = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        firstVc.artistName.text = "Artist Name - \(arrData[indexPath.row].artistName)"
        firstVc.country.text = "Country -  \(arrData[indexPath.row].country)"
        let url = URL(string: arrData[indexPath.row].artworkUrl100)
        firstVc.artworkUrl100.kf.setImage(with: url)
        return firstVc
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = self.storyboard?.instantiateViewController(identifier: "DetailTableViewController") as! DetailTableViewController
        detailVc.modelData = arrData[indexPath.row]
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
}

