//
//  Struct.swift
//  SongDetailApp
//
//  Created by harsh yadav on 10/05/21.
//

import Foundation
import SwiftyJSON

struct jsonModel{
    
    var country: String = ""
    var artistName : String = ""
    var artworkUrl100 : String = ""
    var artistId : String = ""
    var collectionName = ""
    var collectionPrice : String = ""

    init() {
        
    }
    
    init(json:JSON) {
        country = json["country"].stringValue
        artistName = json["artistName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
        artistId = json["artistId"].stringValue
        collectionName = json["collectionName"].stringValue
        collectionPrice = json["collectionPrice"].stringValue
    }
}
