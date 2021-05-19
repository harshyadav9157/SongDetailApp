//
//  DetailTableViewController.swift
//  SongDetailApp
//
//  Created by harsh yadav on 10/05/21.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var collectionName: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var collectionPrice: UILabel!
    @IBOutlet weak var artistId: UILabel!
    
    var modelData = jsonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewWillAppear(_ animated: Bool) {
        artistId.text = modelData.artistId
        country.text = modelData.country
        collectionName.text = modelData.collectionName
        collectionPrice.text = "$\(modelData.collectionPrice)"
        artistName.text = modelData.artistName
        let url = URL(string: modelData.artworkUrl100)
        imgView.kf.setImage(with: url)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}
