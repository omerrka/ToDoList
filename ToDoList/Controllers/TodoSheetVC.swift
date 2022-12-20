//
//  TodoSheetVC.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class TodoSheetVC: UIViewController {
    
    var cancelButton = UIButton()
    var saveButton = UIButton()
    var mainTitleLabel = UILabel()
    var titleLabel = UILabel()
    var shortDescriptionLabel = UILabel()
    var priorityLabel = UILabel()
    var titleTextField = UITextField()
    var shortDescriptionTextField = UITextField()
    var priorityPicker = UIPickerView()
    let prioritys = ["LOW", "MEDIUM", "HIGH"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureCancelButton()
        configureSaveButton()
        configureMainTitleLabel()
        configureTitleLabel()
        configureTitleTextField()
        configureShortDescriptionLabel()
        configureShortDescriptionTextField()
        configurePriorityTitleLabel()
        configurePriorityPicker()
        
        priorityPicker.delegate = self
        priorityPicker.dataSource = self
        
        cancelButton.addTarget(self, action: #selector(cancelToDo(sender:)), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveToDo(sender:)), for: .touchUpInside)


    }
    
    func configureCancelButton() {
        
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 18).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        
    }
    
    func configureSaveButton() {
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 18).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        
    }
    
    func configureMainTitleLabel() {
        
        view.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        mainTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainTitleLabel.numberOfLines = 0
        mainTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        mainTitleLabel.textColor = .black
        mainTitleLabel.text = "Add New Todo"
        
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 48).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.text = "Title"
        
    }
    
    func configureTitleTextField() {
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTextField.borderStyle = UITextField.BorderStyle.bezel
        titleTextField.placeholder = "Title"
    }
    
    func configureShortDescriptionLabel() {
        view.addSubview(shortDescriptionLabel)
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 48).isActive = true
        shortDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shortDescriptionLabel.numberOfLines = 0
        shortDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        shortDescriptionLabel.textColor = .black
        shortDescriptionLabel.text = "Short Description"
        
    }
    
    func configureShortDescriptionTextField() {
        view.addSubview(shortDescriptionTextField)
        shortDescriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionTextField.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 48).isActive = true
        shortDescriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        shortDescriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        shortDescriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shortDescriptionTextField.borderStyle = UITextField.BorderStyle.bezel
        shortDescriptionTextField.placeholder = "Description"
    }
    
    func configurePriorityTitleLabel() {
        
        view.addSubview(priorityLabel)
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.topAnchor.constraint(equalTo: shortDescriptionTextField.bottomAnchor, constant: 48).isActive = true
        priorityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priorityLabel.numberOfLines = 0
        priorityLabel.font = UIFont.systemFont(ofSize: 18)
        priorityLabel.textColor = .black
        priorityLabel.text = "Priority"
        
    }
    
    func configurePriorityPicker() {
        view.addSubview(priorityPicker)
        priorityPicker.translatesAutoresizingMaskIntoConstraints = false
        priorityPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priorityPicker.topAnchor.constraint(equalTo: priorityLabel.bottomAnchor, constant: 12).isActive = true
    }
    
    @objc
    func cancelToDo(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc
    func saveToDo(sender: UIButton) {
        dismiss(animated: true)
    }
}

extension TodoSheetVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        prioritys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        prioritys[row]
    }
    
    
}
