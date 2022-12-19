//
//  SortScreenTableViewCell.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class SortScreenTableViewCell: UITableViewCell {

  
    var titleLabel = UILabel()
    var shortDescriptionLabel = UILabel()
    var priorityLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(shortDescriptionLabel)
        addSubview(priorityLabel)
        configureTitleLabel()
        configurePriorityLabel()
        configureShortDescriptionLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .black
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true

    }
    
    func configureShortDescriptionLabel() {
        shortDescriptionLabel.numberOfLines = 0
        shortDescriptionLabel.adjustsFontSizeToFitWidth = true
        shortDescriptionLabel.textColor = .black
        shortDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        shortDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6).isActive = true
        
    }
    
    func configurePriorityLabel() {
        priorityLabel.numberOfLines = 0
        priorityLabel.adjustsFontSizeToFitWidth = true
        priorityLabel.textColor = .black
        priorityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        priorityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        priorityLabel.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 6).isActive = true
        
    }
}
