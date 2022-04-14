//
//  CustomCellView.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    var infoCallback: (()->Void)?
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        //activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Раса: "
        label.font = .italicSystemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пол: "
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellInit(name: String, image: UIImage, species: String, gender: String) {
        nameLabel.text = name
        avatarImageView.image = image
        speciesLabel.text! = species
        genderLabel.text! = gender
    }

}


// MARK: - private methods
extension CustomCell {
    private func setup() {
        self.backgroundColor = .secondarySystemBackground
        contentView.addSubview(cardView)
        
        cardView.addSubviews(views: [
            avatarImageView,
            nameLabel,
            speciesLabel,
            genderLabel,
        ])
        
        avatarImageView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            
            activityIndicator.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            speciesLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            speciesLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 5),
            genderLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            genderLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
        ])
    }
    
    @objc private func infoTapped() {
        infoCallback?()
    }
    
}

