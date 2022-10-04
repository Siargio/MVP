//
//  GreetingPresenterProtocol.swift
//  MVP
//
//  Created by Sergio on 4.10.22.
//

import Foundation
import UIKit

protocol GreetingPresenterProtocol: AnyObject { //AnyObject говорит что это ссылочный тип данных
    init(view: GreetingViewProtocol, person: Person) //инициализация вьюконтроллера и модели
    func showGreeting()
}

final class GreetingPresenter: GreetingPresenterProtocol {

    private unowned let view: GreetingViewProtocol // ссылка на вюьпротокол помечаем ановн чтобы не было сильных ссылок
    private let person: Person
    private lazy var current = 0

    required init(view: GreetingViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let name = Person.persons[current].name ?? ""
        let surname = Person.persons[current].surname ?? ""
        let age = Person.persons[current].age ?? 0
        view.setGreeting(name: name, surname: surname, age: age)
        current += 1
        if current == Person.persons.count {
            current = 0
        }
    }
}
