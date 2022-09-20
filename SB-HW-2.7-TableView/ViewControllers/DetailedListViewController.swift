//
//  DetailedListViewController.swift
//  SB-HW-2.7-TableView
//
//  Created by Sergey Nestroyniy on 20.09.2022.
//

import UIKit

class DetailedListViewController: UITableViewController {
    
    var personList: [Person]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = tabBarController!.viewControllers!
        for currentVC in viewControllers {
            if let personVC = currentVC as? PersonsListViewController {
                personList = personVC.personList
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return personList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = personList[indexPath.section].phone
            cell.imageView?.image = UIImage.init(systemName: "phone")
        case 1:
            cell.textLabel?.text = personList[indexPath.section].email
            cell.imageView?.image = UIImage.init(systemName: "tray")
        default: fatalError()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personList[section].fullName
    }
}
