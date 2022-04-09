//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Юрий Филатов on 29.03.2022.
//

import UIKit

struct PhotosTableViewCellVIewModel {
    let viewModel: [Photo]
}

protocol PhotosTableViewCellDelegate: AnyObject {
    func collectionTableViewCellDidTupItem()
}


class PhotosTableViewCell: UITableViewCell, UITableViewDelegate {
    

    static var identifier = "PhotosTableViewCell"
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    private var viewModels = Photo.addPicture()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private let arrowButoon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("→", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.addTarget(self, action: #selector(collectionButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CollectionViewCell.self,
                            forCellWithReuseIdentifier: CollectionViewCell.identifire
        )
        collection.dataSource = self
        collection.delegate = self
        
        
        return collection
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    private func layout() {
        [title, arrowButoon, collectionView].forEach{ contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButoon.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowButoon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowButoon.widthAnchor.constraint(equalToConstant: 24),
            arrowButoon.heightAnchor.constraint(equalToConstant: 24),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 110),
            
            
            contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8)
        ])
        
        
    }
    
    @objc func collectionButton() {
        print("Button was tapt")
        delegate?.collectionTableViewCellDidTupItem()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifire,
            for: indexPath
        ) as? CollectionViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
}

extension PhotosTableViewCell: PhotosTableViewCellDelegate {
    func collectionTableViewCellDidTupItem() {
        
    }
    
    
}


