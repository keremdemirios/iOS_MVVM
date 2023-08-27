//
//  MainTableViewCell.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 26.08.2023.
//

import UIKit
import SDWebImage

class MainMovieTableViewCell: UITableViewCell {
    static let cellIdentifier = "MainMovieTableViewCell"
    
    private let moviesContentView: UIView = {
        let moviesContentView = UIView()
        moviesContentView.translatesAutoresizingMaskIntoConstraints = false
        moviesContentView.layer.borderColor = UIColor.label.cgColor
        moviesContentView.backgroundColor = .lightGray
        return moviesContentView
    }()
    
    private let movieImageView: UIImageView = {
        let movieImageView = UIImageView()
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.sizeToFit()
        return movieImageView
    }()
    
    private let nameTitle:UILabel = {
        let nameTitle = UILabel()
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.font = UIFont(name: "Overpass-Bold", size: 14.0)
        nameTitle.text = "Name"
        nameTitle.textColor = .label
        nameTitle.numberOfLines = 3
        return nameTitle
    }()
    
    private let dateTitle:UILabel = {
        let dateTitle = UILabel()
        dateTitle.translatesAutoresizingMaskIntoConstraints = false
        dateTitle.font = UIFont(name: "Overpass-SemiBold", size: 12.0)
        dateTitle.text = "Date"
        dateTitle.textColor = .label
        return dateTitle
    }()
    
    private let rateTitle:UILabel = {
        let rateTitle = UILabel()
        rateTitle.translatesAutoresizingMaskIntoConstraints = false
        rateTitle.font = UIFont(name: "Overpass", size: 11.0)
        rateTitle.text = "Rate"
        rateTitle.textColor = .label
        return rateTitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("class aktif")
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        setupUI()
    }
    
    private func setupUI(){
        addSubview(moviesContentView)
        // round for content view
        moviesContentView.round(10)
        // border for content view
        moviesContentView.addBorder(color: .label, width: 1)
        NSLayoutConstraint.activate([
            // content view constraints
            moviesContentView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            moviesContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            moviesContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moviesContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        // round for image view
        movieImageView.round(5)
        moviesContentView.addSubViews(movieImageView, nameTitle, dateTitle, rateTitle)
        NSLayoutConstraint.activate([
            // movie image view constraints
            movieImageView.topAnchor.constraint(equalTo: moviesContentView.topAnchor, constant: 5),
            movieImageView.bottomAnchor.constraint(equalTo: moviesContentView.bottomAnchor, constant: -5),
            movieImageView.leadingAnchor.constraint(equalTo: moviesContentView.leadingAnchor, constant: 8),
            // name constraints
            nameTitle.topAnchor.constraint(equalTo: moviesContentView.topAnchor, constant: 5),
            nameTitle.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 7.5),
            nameTitle.trailingAnchor.constraint(equalTo: moviesContentView.trailingAnchor, constant: -7.5),
            // date constraints
            dateTitle.bottomAnchor.constraint(equalTo: moviesContentView.bottomAnchor, constant: -30),
            dateTitle.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 7.5),
            dateTitle.trailingAnchor.constraint(equalTo: moviesContentView.trailingAnchor, constant: -7.5),
            // rate constraints
            rateTitle.bottomAnchor.constraint(equalTo: moviesContentView.bottomAnchor, constant: -5),
            rateTitle.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 7.5),
            rateTitle.trailingAnchor.constraint(equalTo: moviesContentView.trailingAnchor, constant: -7.5)
        ])
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        nameTitle.text = viewModel.title
        dateTitle.text = viewModel.date
        rateTitle.text = viewModel.rating
        movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
