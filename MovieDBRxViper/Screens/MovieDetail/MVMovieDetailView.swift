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
    
    //TODO: Assess the GCD. Change if neccessary
    private lazy var youtubePlayer: WKYTPlayerView = {
        let view = WKYTPlayerView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 12)
        view.textColor = .gray
        return view
    }()
    
    private lazy var overviewLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    func setup(vc: MVMovieDetailViewController) {
        backgroundColor = .white
        addSubviews(self.youtubePlayer, titleLabel, dateLabel, overviewLabel)
        
//        TODO: Move to viewcontroller
//        DispatchQueue.main.async {
//            self.youtubePlayer.load(withVideoId: "6JnN1DmbqoU")
//        }
        setupConstraints()
    }
    
    func configureData(with movie: MVMovie) {
        let df = DateFormatter()
        df.dateFormat = "y-m-d"
        var date = df.date(from: movie.release_date ?? "2022-01-01")
        var formattedDate = date?.formatted(date: .abbreviated, time: .omitted)
        
        
        titleLabel.text = movie.title
        if let date = formattedDate {
            dateLabel.text = "\(date)"
        }
        overviewLabel.text = movie.overview
        
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
