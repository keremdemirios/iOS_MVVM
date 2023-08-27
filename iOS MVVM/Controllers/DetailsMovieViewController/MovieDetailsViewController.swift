//
//  MovieDetailsViewController.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 27.08.2023.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
    // MARK : UI Elements
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let descriptionLabel:UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    // View Model
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Movie Details"
        configure()
    }
    
    // MARK : Configure
    private func configure(){
        setupUI()
        titleLabel.text = viewModel.movieTite
        descriptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }
    
    // MARK : Setup UI
    private func setupUI(){
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentView.addSubViews(imageView, titleLabel, descriptionLabel)
        NSLayoutConstraint.activate([
            // image view constraint
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            // title label constraint
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            // description label constraint
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    // MARK : Functions
    
    // MARK : Actions
}
