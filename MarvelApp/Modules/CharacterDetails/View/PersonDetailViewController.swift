//
//  PersonDetailViewController.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableViewWorks: UITableView!
    
    //MARK:- Variables
    var rowCount: Int = 0
    var presenter: PersonDetailPresentation?
    
    var arraySections = [(key: String, list: [PersonWorkItem], type: ItemType)]() {
        didSet {
            self.tableViewWorks.reloadData()
        }
    }
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.onViewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.tableViewWorks.register(R.nib.personDetailCell(), forCellReuseIdentifier: Constants.Cell.characterDetails)
        self.tableViewWorks.delegate = self
        self.tableViewWorks.dataSource = self
    }
    
}

//MARK:- Extensions on Person Detail View Controller
extension PersonDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PersonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arraySections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.characterDetails) as! PersonDetailCell
        let item = self.arraySections[indexPath.row]
        cell.initialize(items: item.list, title: item.key, type: item.type, presenter: self.presenter)
        
        return cell
    }
    
}


extension PersonDetailViewController: PersonDetailView {
    func showDetails(sections: [(key: String, list: [PersonWorkItem], type: ItemType)]) {
        self.arraySections = sections
    }
    
    func setTitle(person: Person) {
        self.title = person.name
    }
    
    func reloadPerson() {
        //        self.tableViewWorks.reloadData()
    }
    
}
