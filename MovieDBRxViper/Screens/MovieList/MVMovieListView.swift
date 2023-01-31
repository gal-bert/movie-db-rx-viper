//
//  MVMovieListView.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import UIKit
import SnapKit

class MVMovieListView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()
    
    func setup(vc: MVMovieListViewController) {
        backgroundColor = .systemBackground
        collectionView.delegate = vc
        collectionView.dataSource = vc
        collectionView.register(MVMovieListCollectionViewCell.self, forCellWithReuseIdentifier: MVMovieListCollectionViewCell.identifier)
        
        vc.navigationItem.largeTitleDisplayMode = .always
        
        addSubview(collectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
}
