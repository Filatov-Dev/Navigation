//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юрий Филатов on 10.03.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "21121")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 65
        image.clipsToBounds = true
        
        return image
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        
        return label
    }()
    
    private let statusLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        return label
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(pressStatusButton), for: .touchUpInside)
        
        return button
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.placeholder = "Change status"
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    private var statusText: String = ""
    
    
    @objc func pressStatusButton() {
        statusLabel.text = statusTextField.text
        print(statusLabel.text ?? "Non")
        print(statusText)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text{
            statusText = text
        }
    }
    
    
    func addConstraints() {
        
        [mainImage, userName, statusLabel, statusButton, statusTextField].forEach{ addSubview($0) }
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            mainImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainImage.widthAnchor.constraint(equalToConstant: 130),
            mainImage.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 35),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 35),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
