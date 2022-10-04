//
//  GreetingViewProtocol.swift
//  MVP
//
//  Created by Sergio on 4.10.22.
//

import UIKit

protocol GreetingViewProtocol: AnyObject { //AnyObject говорит что это ссылочный тип данных
    func setGreeting(name: String, surname: String, age: Int)
}

final class GreetingViewController: UIViewController {

    var presenter: GreetingPresenterProtocol! // ссылка на презентер

    private lazy var greetingNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var greetingSurnameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var greetingAgeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var showGreetingButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let person = Person()
        presenter = GreetingPresenter(view: self, person: person)
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(greetingNameLabel)
        view.addSubview(greetingSurnameLabel)
        view.addSubview(greetingAgeLabel)
        view.addSubview(showGreetingButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            greetingNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            greetingNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            greetingSurnameLabel.topAnchor.constraint(equalTo: greetingNameLabel.bottomAnchor, constant: 50),
            greetingSurnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            greetingSurnameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            greetingAgeLabel.topAnchor.constraint(equalTo: greetingSurnameLabel.bottomAnchor, constant: 50),
            greetingAgeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            greetingAgeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            showGreetingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            showGreetingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            showGreetingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }

    @objc func didTapButton() {
        presenter?.showGreeting() //реализация в презентере
    }
}

extension GreetingViewController: GreetingViewProtocol {
    func setGreeting(name: String, surname: String, age: Int) {
        greetingNameLabel.text = name
        greetingSurnameLabel.text = surname
        greetingAgeLabel.text = String(age)
    }
}
