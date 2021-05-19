//
//  FirstTableViewCell.swift
//  SongDetailApp
//
//  Created by harsh yadav on 10/05/21.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkUrl100: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
