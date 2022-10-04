//
//  model.swift
//  MVP
//
//  Created by Sergio on 4.10.22.
//

import Foundation
// моделька
struct Person {
    var name: String?
    var surname: String?
    var age: Int?
}

extension Person {
    static var persons = [
        Person(name: "Dasha", surname: "Masiuk", age: 25),
        Person(name: "Siarhei", surname: "Masiuk", age: 30),
        Person(name: "Kira", surname: "Masiuk", age: 1),
        Person(name: "Misha", surname: "Abramuk", age: 29)
    ]
}
