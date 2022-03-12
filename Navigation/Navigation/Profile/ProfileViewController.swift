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
        return profile
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = "Profile"
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        profile.frame = self.view.frame
        view.addSubview(profile)
        profile.addConstraints(view: view)
    }

    
    
}
