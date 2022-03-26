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
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(PostTableViewCell .self, forCellReuseIdentifier: String(describing: PostTableViewCell.self ))
        return table
        
    }()
    
    private var arrayOfContent = [Any]()
    private let posts = Post.makeArray()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = "Profile"
        
        addView()
        
//        profile.addConstraints()
        setConstrains()
        
        arrayOfContent.append(profile)
        arrayOfContent += posts
    }
    
    private func addView() {
        [tableView, profile].forEach{ view.addSubview($0) }
    }
    
    func setConstrains() {
        
        tableView.frame = view.bounds
        
//        NSLayoutConstraint.activate([
//            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profile.heightAnchor.constraint(equalToConstant: 220)
//        ])
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self ), for: indexPath) as! PostTableViewCell
        
        return cell
    }
    
}
