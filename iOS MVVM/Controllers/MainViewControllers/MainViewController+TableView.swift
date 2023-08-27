//
//  MainViewController+TableView.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        configureUITableView()
    }
    
    
    public func configureUITableView(){
        view.addSubViews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numbersOfSection()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieTableViewCell.cellIdentifier, for: indexPath) as! MainMovieTableViewCell
        let cellViewModel = cellDataSource[indexPath.row]
        cell.selectionStyle = .none
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

