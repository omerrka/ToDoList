//
//  HomeScreenVC.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

let reloadTableViewNotificationKey = "reloadTableView"

class HomeScreenVC: UIViewController, CoreDataDelegate {
    
    let coreDataViewModel = CoreDataViewModel()
    let todoSheetVC = TodoSheetVC()
    private let homeScreenListCell = HomeSortScreenTableViewCell()
    var tableView = UITableView()
    var mainTitleLabel = UILabel()
    var addButton = UIButton()
    
    let reload = Notification.Name(reloadTableViewNotificationKey)
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    struct Cells {
        static let homeCell = "HomeScreenTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureAddButton()
        configureMainTitle()
        setTableViewDelegates()
        configureTableView()
        createObserver()
        coreDataViewModel.getAllItems()
        coreDataViewModel.delegate = self
        addButton.addTarget(self, action: #selector(addToDo(sender:)), for: .touchUpInside)
    }
    
    func createObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeScreenVC.updateTableView(notification:)), name: reload, object: nil)
    }
    
    @objc func updateTableView(notification: NSNotification) {
        DispatchQueue.main.async {
            self.coreDataViewModel.getAllItems()
        }
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
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46).isActive = true
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func configureTableView() {
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomeSortScreenTableViewCell.self, forCellReuseIdentifier: Cells.homeCell)
        
        view.addSubview(tableView)
        tableView.pin(to: view, mainTitleLabel: mainTitleLabel)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc
    func addToDo(sender: UIButton) {
        
        if let sheet = todoSheetVC.sheetPresentationController {
            sheet.detents = [.large()]
            
        }
        
        present(self.todoSheetVC, animated: true)
    }
    
    func reloadToDoList() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataViewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = coreDataViewModel.models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.homeCell) as! HomeSortScreenTableViewCell
        
        cell.titleLabel.text = model.title
        cell.shortDescriptionLabel.text = model.shorDesc
        
        if model.priority == "HIGH" {
            cell.priorityLabel.textColor = .systemRed
        } else if model.priority == "MEDIUM" {
            cell.priorityLabel.textColor = .systemGray3
        } else if model.priority == "LOW" {
            cell.priorityLabel.textColor = .systemBlue
        }
        
        cell.priorityLabel.text = model.priority
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let item = coreDataViewModel.models[indexPath.row]
        
        let alert = UIAlertController(title: "Delete ToDo?", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.coreDataViewModel.deleteItem(item: item)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        
        self.present(alert, animated: true, completion: {
        })
    }
}
