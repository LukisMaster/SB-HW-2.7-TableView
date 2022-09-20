//
//  InfoViewController.swift
//  SB-HW-2.7-TableView
//
//  Created by Sergey Nestroyniy on 20.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var titleItem: UINavigationItem!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleItem.title = person.fullName
        phoneLabel.text! = "Phone: \(person.phone)"
        emailLabel.text! = "Email: \(person.email)"
        
        tabBarController?.tabBar.isHidden = true
    }
    
}
