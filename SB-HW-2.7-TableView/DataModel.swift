//
//  DataModel.swift
//  SB-HW-2.7-TableView
//
//  Created by Sergey Nestroyniy on 20.09.2022.
//

import Darwin

struct Person {
    var firstName, lastName, phone, email : String
    var fullName : String {
        return firstName + " " + lastName
    }
    
    init (firstName: String, lastName: String, phone: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
    }
    
    init (_ person: Person) {
        firstName = person.firstName
        lastName = person.lastName
        phone = person.phone
        email = person.email
    }
    
    static func randomPersonList () -> [Person] {
        let dataManager = DataManager()
        var persons = [Person]()
        while let person = dataManager.randomPerson() {
            persons.append(person)
        }
        return persons
    }
}

class DataManager {
    var firstName, lastName, phone, email : [String]
    
    init () {
        firstName = ["Maxim", "Elena", "Andrey", "Juliya", "Konastantin", "Olesya", "Evgeniy", "Tatyana", "Sergey", "Olga"]
        lastName = ["Evseev", "Volkov", "Sitko", "Sizonenko", "Zhilcov", "Koroteev", "Balabanov", "Fily", "Jhonson", "Griffin"]
        phone = ["+7-177-654-32-10", "+7-123-423-45-76", "+7-765-345-13-56", "+7-567-987-39-29", "+7-428-589-52-11", "+7-678-234-13-34", "+7-123-620-33-22", "7-123-435-45-12", "+7-481-333-22-11", "+7-523-212-32-12"]
        email = ["qwe@qwe.ru", "ghjk@mail.ru", "wejKJJH23@gmail.com", "fsfs@yandex.ru", "wqehkqwhje@ya.ru", "amary@yahoo.com", "kjahsd@amazon.com","erwuiyh@google.com","adsyuiy@imail.com","elon@musk.tesla"]
    }
    
    func randomPerson () -> Person? {
        guard !firstName.isEmpty && !lastName.isEmpty && !phone.isEmpty && !email.isEmpty else {return nil}
        let fName = firstName.remove(at: Int.random(in: 0..<firstName.count))
        let lName = lastName.remove(at: Int.random(in: 0..<lastName.count))
        let phone = self.phone.remove(at: Int.random(in: 0..<self.phone.count))
        let email = self.email.remove(at: Int.random(in: 0..<self.email.count))
        
        return Person(firstName: fName, lastName: lName, phone: phone, email: email)
    }
}
