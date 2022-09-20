//
//  TableViewController.swift
//  SB-HW-2.7-TableView
//
//  Created by Sergey Nestroyniy on 20.09.2022.
//

import UIKit

class PersonsListViewController: UITableViewController {
    
    let personList = Person.randomPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        let person = personList[indexPath.row]
        cell.textLabel?.text = person.fullName
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoVC = segue.destination as? InfoViewController {
            let indexPath = tableView.indexPathForSelectedRow!
            infoVC.person = personList[indexPath.row]
        }

        
    }
    

}
