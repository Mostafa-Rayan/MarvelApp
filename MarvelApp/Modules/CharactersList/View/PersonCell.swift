//
//  PersonListCell.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit

class PersonCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK:- Variables
    var person: Person?
    
    //MARK:- Methods
    func update(with person: Person) {
        self.person = person
        self.nameLabel.text = person.name
        self.characterImage.load(thumbnail: person.thumbnail, size: .portrait_small, onComplete: { (image) in
        })
    }
}
