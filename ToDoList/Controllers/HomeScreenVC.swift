//
//  HomeScreenVC.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    private let homeScreenListCell = HomeScreenTableViewCell()
    var tableView = UITableView()
    var mainTitleLabel = UILabel()
    var addButton = UIButton()

    struct Cells {
        static let homeCell = "HomeScreenTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureAddButton()
        configureMainTitle()
        configureTableView()
        setTableViewDelegates()

    }
    
    func configureMainTitle() {
        view.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        mainTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        mainTitleLabel.numberOfLines = 0
        mainTitleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        mainTitleLabel.textColor = .black
        mainTitleLabel.text = "Todo's ✅"
    }
    
    func configureAddButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36).isActive = true
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 30
        tableView.register(HomeScreenTableViewCell.self, forCellReuseIdentifier: Cells.homeCell)
        tableView.pin(to: view, mainTitleLabel: mainTitleLabel)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.homeCell) as! HomeScreenTableViewCell

        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
