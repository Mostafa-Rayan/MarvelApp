//
//  PersonDetailWorkCell.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit
import Foundation
import Moya


class PersonDetailWorkCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    //MARK:- Variables
    var item: PersonWorkItem!
    
    //MARK:- Methods
    func initialize(item: PersonWorkItem) {
        self.item = item
        self.setup()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setup), name: NSNotification.Name(rawValue:"NOTIFIE\(item.getId()!)"), object: nil)
    }
    
    
    
    @objc func setup(){
        self.titileLabel.text = self.item.name
        self.coverImageView.image = UIImage()
        
        if let work = item.work {
            self.coverImageView.load(thumbnail: work.thumbnail, size: .portrait_uncanny) { (image) in
                NotificationCenter.default.removeObserver(self)
            }
        }
    }
}
