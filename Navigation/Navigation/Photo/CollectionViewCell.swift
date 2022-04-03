//
//  PhotosCollectionTableViewCellCollectionViewCell.swift
//  Navigation
//
//  Created by Юрий Филатов on 29.03.2022.
//

import UIKit

struct CollectionViewCellModel {
    let image: UIImage
}

class CollectionViewCell: UICollectionViewCell {
    
    static let identifire = "CollectionViewCell"
    
    
    var delegate: PhotosTableViewCellDelegate?
    
    private let picture: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.backgroundColor = .red
        picture.layer.cornerRadius = 4
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        
        return picture
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16

        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func layout() {
        contentView.addSubview(picture)
        picture.frame = contentView.bounds
    }
    
    func configure(with viewModel: Photo) {
        picture.image = UIImage(named: viewModel.picture)
    }
    
}
