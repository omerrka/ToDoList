//
//  SortScreenVC.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class SortScreenVC: UIViewController, CoreDataDelegate {
    
    private let sortScreenListCell = HomeSortScreenTableViewCell()
    let coreDataViewModel = CoreDataViewModel()
    var tableView = UITableView()
    var lowLevelButton = UIButton()
    var mediumLevelButton = UIButton()
    var highLevelButton = UIButton()
    var backgroundForButton = UIView()
    var priorityLevel = "LOW"
    
    struct Cells {
        static let sortCell = "HomeSortScreenTableViewCell"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coreDataViewModel.getLowLevelPriorityTodo()
        coreDataViewModel.getMediumLevelPriorityTodo()
        coreDataViewModel.getHıghLevelPriorityToDo()
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
        coreDataViewModel.delegate = self
        
        coreDataViewModel.getLowLevelPriorityTodo()
        
        lowLevelButton.addTarget(self, action: #selector(showLowLevelToDo(sender:)), for: .touchUpInside)
        mediumLevelButton.addTarget(self, action: #selector(showMediumLevelToDo(sender:)), for: .touchUpInside)
        highLevelButton.addTarget(self, action: #selector(showHighLevelToDo(sender:)), for: .touchUpInside)
        
        
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
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomeSortScreenTableViewCell.self, forCellReuseIdentifier: Cells.sortCell)
        
        view.addSubview(tableView)
        tableView.secondPin(to: view, backgroundView: backgroundForButton)
        
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc
    func showLowLevelToDo(sender: UIButton) {
        
        priorityLevel = "LOW"
        coreDataViewModel.getLowLevelPriorityTodo()
        lowLevelButton.backgroundColor = .white
        mediumLevelButton.backgroundColor = .clear
        highLevelButton.backgroundColor = .clear
        
    }
    
    @objc
    func showMediumLevelToDo(sender: UIButton) {
        
        priorityLevel = "MEDIUM"
        coreDataViewModel.getMediumLevelPriorityTodo()
        lowLevelButton.backgroundColor = .clear
        mediumLevelButton.backgroundColor = .white
        highLevelButton.backgroundColor = .clear
        
    }
    
    @objc
    func showHighLevelToDo(sender: UIButton) {
        
        priorityLevel = "HIGH"
        coreDataViewModel.getHıghLevelPriorityToDo()
        lowLevelButton.backgroundColor = .clear
        mediumLevelButton.backgroundColor = .clear
        highLevelButton.backgroundColor = .white
        
    }
    
    func reloadToDoList() {
        
        self.tableView.reloadData()
    }
    
}

extension SortScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var x = 10
        
        if priorityLevel == "LOW" {
            
            x = coreDataViewModel.lowLevelItem.count
            
        } else if priorityLevel == "MEDIUM" {
            
            x = coreDataViewModel.mediumLevelItem.count
            
        } else if priorityLevel == "HIGH" {
            
            x = coreDataViewModel.highLevelItem.count
            
        }
        
        return x
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.sortCell) as! HomeSortScreenTableViewCell
        
        if priorityLevel == "LOW" {
            let lowLevelData = coreDataViewModel.lowLevelItem[indexPath.row]
            
            if coreDataViewModel.lowLevelItem.count > 0 {
                
                cell.titleLabel.text = lowLevelData.title
                cell.shortDescriptionLabel.text = lowLevelData.shorDesc
                cell.priorityLabel.textColor = .systemBlue
                cell.priorityLabel.text = lowLevelData.priority
                
            }
        }
        
        if priorityLevel == "MEDIUM" {
            
            let mediumLevelData = coreDataViewModel.mediumLevelItem[indexPath.row]
            
            if coreDataViewModel.mediumLevelItem.count > 0 {
                
                cell.titleLabel.text = mediumLevelData.title
                cell.shortDescriptionLabel.text = mediumLevelData.shorDesc
                cell.priorityLabel.textColor = .systemGray3
                cell.priorityLabel.text = mediumLevelData.priority
                
            }
        }
        
        if priorityLevel == "HIGH" {
            
            let highLevelData = coreDataViewModel.highLevelItem[indexPath.row]
            
            if coreDataViewModel.highLevelItem.count > 0 {
                
                cell.titleLabel.text = highLevelData.title
                cell.shortDescriptionLabel.text = highLevelData.shorDesc
                cell.priorityLabel.textColor = .systemRed
                cell.priorityLabel.text = highLevelData.priority
                
            }
        }
        
        return cell
        
    }
}


