//
//  HomeScreenTableViewCell.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class HomeSortScreenTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var shortDescriptionLabel = UILabel()
    var priorityLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .black
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -12).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 6).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        contentView.addSubview(shortDescriptionLabel)
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.numberOfLines = 0
        shortDescriptionLabel.adjustsFontSizeToFitWidth = true
        shortDescriptionLabel.textColor = .black
        shortDescriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 12).isActive = true
        shortDescriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -12).isActive = true
        shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6).isActive = true
        shortDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
        contentView.addSubview(priorityLabel)
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.numberOfLines = 0
        priorityLabel.adjustsFontSizeToFitWidth = true
        priorityLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 12).isActive = true
        priorityLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -12).isActive = true
        priorityLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        priorityLabel.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 6).isActive = true
        priorityLabel.font = UIFont.systemFont(ofSize: 16)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTitleLabel() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .black
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
    }
    
    func configureShortDescriptionLabel() {
        
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.numberOfLines = 0
        shortDescriptionLabel.adjustsFontSizeToFitWidth = true
        shortDescriptionLabel.textColor = .black
        shortDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        shortDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        shortDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
    }
    
    func configurePriorityLabel() {
        
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.numberOfLines = 0
        priorityLabel.adjustsFontSizeToFitWidth = true
        priorityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        priorityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        priorityLabel.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 8).isActive = true
        priorityLabel.font = UIFont.systemFont(ofSize: 16)
        
    }
}


