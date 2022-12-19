//
//  UIView+Ext.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView, mainTitleLabel: UILabel) {
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 10).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        
    }
    
    func secondPin(to superView: UIView, backgroundView: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 10).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        
    }
    
}
