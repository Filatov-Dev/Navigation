//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Юрий Филатов on 23.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let content: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .cyan
        return content
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .purple
        contentView.layer.borderWidth = 4
        contentView.layer.borderColor = UIColor.black.cgColor
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubview(content)
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            content.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
    }
    

}
