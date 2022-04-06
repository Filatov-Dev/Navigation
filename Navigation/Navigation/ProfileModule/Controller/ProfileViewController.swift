//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юрий Филатов on 03.03.2022.
//

import UIKit

protocol Present: AnyObject {
    func presentVC()
}

class ProfileViewController: UIViewController, UICollectionViewDelegate {
    
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
    
    private lazy var photosViewCell = PhotosTableViewCell()
    
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
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            photosViewCell.collectionView.delegate = self
            let cell = PhotosTableViewCell()
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self ), for: indexPath) as! PostTableViewCell
        cell.connectionWithPost(with: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        section == 0 ? profile : nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(row: 0, section: 0) {
            tableView.deselectRow(at: indexPath, animated: true)

            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableViewCell.identifier, for: indexPath)

        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let photoVC = PhotosViewController()
        photoVC.title = "Photo Gallery"
        navigationController?.pushViewController(photoVC, animated: true)
    }

    private var sideInset: CGFloat { return 12 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - sideInset * 3) / 4

        return CGSize(width: width, height: width)
    }
}

extension ProfileViewController: PhotosTableViewCellDelegate {
    func collectionTableViewCellDidTupItem() {
        let photoVC = PhotosViewController()
        navigationController?.pushViewController(photoVC, animated: true)
    }
}
