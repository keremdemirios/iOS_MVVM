//
//  ViewController.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
// MARK : UI Elements
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainViewController.cellIdentifier)
        return tableView
    }()
    
    // MARK : View Model
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .systemBackground
        navigationItem.title = "Main"
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
}

