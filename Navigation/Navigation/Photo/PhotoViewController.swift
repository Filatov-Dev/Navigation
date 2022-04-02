//
//  CollectionViewController.swift
//  Navigation
//
//  Created by Юрий Филатов on 02.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private let photos: [Photo] = Photo.addPicture()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        title = "Photos"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource
