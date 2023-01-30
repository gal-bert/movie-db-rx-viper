//
//  MVMovieDetailView.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 31/01/23.
//

import UIKit
import SnapKit
import YoutubePlayer_in_WKWebView

class MVMovieDetailView: UIView {
    
    private lazy var youtubePlayer: WKYTPlayerView = {
        let view = WKYTPlayerView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
//        view.font = UIFont(name: view.font.fontName, size: 14)
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 0
        view.text = "Puss in Boots: The Last Wish Puss in Boots: The Last Wish"
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 12)
        view.textColor = .gray
        view.text = "07 Dec 2022"
        return view
    }()
    
    private lazy var overviewLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 14)
        view.text = "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives."
        return view
    }()
    
    func setup(vc: MVMovieDetailViewController) {
        backgroundColor = .white
        addSubviews(self.youtubePlayer, titleLabel, dateLabel, overviewLabel)
        
        // TODO: Move to viewcontroller
        DispatchQueue.main.async {
            self.youtubePlayer.load(withVideoId: "6JnN1DmbqoU")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        youtubePlayer.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(10)
            make.left.right.equalTo(self).inset(20)
            make.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(youtubePlayer.snp.bottom).offset(10)
        }
        dateLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        overviewLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
        }
    }
    
}
