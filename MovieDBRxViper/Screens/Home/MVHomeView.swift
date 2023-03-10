//
//  MVHomeView.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    func setup(vc: MVHomeViewController) {
        backgroundColor = .systemBackground
        tableView.delegate = vc
        tableView.dataSource = vc
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "genreCell")
        
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        
        addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
}
