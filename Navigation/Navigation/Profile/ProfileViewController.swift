//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юрий Филатов on 03.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profile: ProfileHeaderView = {
        let profile = ProfileHeaderView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private let newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 18
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = "Profile"
        
        addView()
        
        profile.addConstraints()
        setConstrains()
    }
    
    private func addView() {
        [newButton, profile].forEach{ view.addSubview($0) }
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profile.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    

    
    
}
