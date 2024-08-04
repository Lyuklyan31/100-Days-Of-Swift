//
//  ViewController.swift
//  GuesstheFlag
//
//  Created by admin on 27.07.2024.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    private let buttonOne = UIButton()
    private let buttonTwo = UIButton()
    private let buttonThree = UIButton()
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultConfiguration()
    }

    private func defaultConfiguration() {
        setupUI()
        countriesAppend()
        setupNavigationBar()
      
    }
    
    private func setupNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        }
        view.backgroundColor = .systemBackground
        title = countries[correctAnswer].uppercased()
    }
    
    private func setupUI() {
        setupButtonOne()
        setupButtonTwo()
        setupButtonThree()
    }
    
    private func setupButtonOne() {
        buttonOne.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonOne.layer.borderWidth = 1
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(buttonOne)
        buttonOne.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    private func setupButtonTwo() {
        buttonTwo.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonTwo.layer.borderWidth = 1
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(buttonTwo)
        buttonTwo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(buttonOne.snp.top).offset(-25)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    private func setupButtonThree() {
        buttonThree.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonThree.layer.borderWidth = 1
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(buttonThree)
        buttonThree.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonOne.snp.bottom).offset(25)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func countriesAppend() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
    }
}
