//
//  MVMovieListCollectionViewCell.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import UIKit
import SnapKit
import SDWebImage

class MVMovieListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "mvMovieListCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(model: MVMovie) {
        imageView.sd_imageTransition = .fade
        if let imagePath = model.poster_path, let title = model.title {
            imageView.sd_setImage(with: URL(string: "\(Constants.imagePath)\(imagePath)"))
            titleLabel.text = title
        }
    }
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
        
    }
    
}
