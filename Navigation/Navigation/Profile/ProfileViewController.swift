//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юрий Филатов on 03.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profile: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        
        return profileHeaderView
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
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
        setConstrains()
    }
    
    private func addView() {
        [tableView].forEach{ view.addSubview($0) }
    }
    
    func setConstrains() {
        
        tableView.frame = view.bounds
        
    }
    
    
    private func addPost() {
        
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self ), for: indexPath) as! PostTableViewCell
        cell.connectionWithPost(with: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        profile
    }
    
    
}
