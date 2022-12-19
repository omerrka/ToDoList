//
//  SortScreenVC.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class SortScreenVC: UIViewController {
    
    private let sortScreenListCell = SortScreenTableViewCell()
    var tableView = UITableView()
    
    var lowLevelButton = UIButton()
    var mediumLevelButton = UIButton()
    var highLevelButton = UIButton()
    var backgroundForButton = UIView()
    
    struct Cells {
        static let sortCell = "SortScreenTableViewCell"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(backgroundForButton)
        view.addSubview(lowLevelButton)
        view.addSubview(mediumLevelButton)
        view.addSubview(highLevelButton)
        
        configurePriorityLevelButtons()
        configureBackgroundForButton()
        configureTableView()
        setTableViewDelegates()


    }
    
    func configurePriorityLevelButtons() {
        
        mediumLevelButton.translatesAutoresizingMaskIntoConstraints = false
        mediumLevelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mediumLevelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        mediumLevelButton.setTitle("Medium", for: .normal)
        mediumLevelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        mediumLevelButton.setTitleColor(.black, for: .normal)
        mediumLevelButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        mediumLevelButton.layer.cornerRadius = 8

        lowLevelButton.translatesAutoresizingMaskIntoConstraints = false
        lowLevelButton.trailingAnchor.constraint(equalTo: mediumLevelButton.leadingAnchor, constant: -20).isActive = true
        lowLevelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        lowLevelButton.setTitle("Low", for: .normal)
        lowLevelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        lowLevelButton.setTitleColor(.black, for: .normal)
        lowLevelButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        lowLevelButton.layer.cornerRadius = 8
        lowLevelButton.backgroundColor = .white

        highLevelButton.translatesAutoresizingMaskIntoConstraints = false
        highLevelButton.leadingAnchor.constraint(equalTo: mediumLevelButton.trailingAnchor, constant: 20).isActive = true
        highLevelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        highLevelButton.setTitle("High", for: .normal)
        highLevelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        highLevelButton.setTitleColor(.black, for: .normal)
        highLevelButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        highLevelButton.layer.cornerRadius = 8
        
    }
    
    func configureBackgroundForButton() {
        
        backgroundForButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundForButton.topAnchor.constraint(equalTo: mediumLevelButton.topAnchor, constant: -4).isActive = true
        backgroundForButton.bottomAnchor.constraint(equalTo: mediumLevelButton.bottomAnchor, constant: 4).isActive = true
        backgroundForButton.leadingAnchor.constraint(equalTo: lowLevelButton.leadingAnchor, constant: -24).isActive = true
        backgroundForButton.trailingAnchor.constraint(equalTo: highLevelButton.trailingAnchor, constant: 24).isActive = true
        backgroundForButton.backgroundColor = .systemGray5
        backgroundForButton.layer.cornerRadius = 10

    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(HomeScreenTableViewCell.self, forCellReuseIdentifier: Cells.sortCell)
        tableView.secondPin(to: view, backgroundView: backgroundForButton)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SortScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.sortCell) as! HomeScreenTableViewCell

        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

