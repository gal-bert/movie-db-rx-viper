//
//  MVMovieDetailInteractor.swift
//  Project: MovieDBRxViper
//
//  Module: MVMovieDetail
//
//  By Gregorius Albert 31/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import Foundation
import SwiftyVIPER
import RxSwift
import RxCocoa

// MARK: Protocols

/// Should be conformed to by the `MVMovieDetailInteractor` and referenced by `MVMovieDetailPresenter`
protocol MVMovieDetailPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
    func getObsMovie() -> BehaviorRelay<MVMovie>
    func getObsVideo() -> BehaviorRelay<MVVideo>
    func loadVideo()
}

// MARK: -

/// The Interactor for the MVMovieDetail module
final class MVMovieDetailInteractor: MVMovieDetailPresenterInteractorProtocol {

	// MARK: - Variables

	weak var presenter: MVMovieDetailInteractorPresenterProtocol?
        
    var disposeBag = DisposeBag()
    
    var obsMovie = BehaviorRelay<MVMovie>(value: MVMovie())
    var obsVideo = BehaviorRelay<MVVideo>(value: MVVideo())
    
    init() {
        setupObserver()
    }
        
    func setupObserver(){
        _ = obsMovie.subscribe { _ in
            self.presenter?.reloadData()
        }.disposed(by: disposeBag)
        
        _ = obsVideo.subscribe { _ in
            self.presenter?.reloadData()
        }.disposed(by: disposeBag)
        
    }

	// MARK: - MVMovieDetail Presenter to Interactor Protocol
    
    func getObsMovie() -> BehaviorRelay<MVMovie> {
        return obsMovie
    }
    
    func getObsVideo() -> BehaviorRelay<MVVideo> {
        return obsVideo
    }
    
    func loadVideo() {
        APIManager.shared.fetchMovieVideos(movieId: obsMovie.value.id ?? 0) { [weak self] response in
            switch response {
            case .success(let videos):
                let results = videos.results
                let filtered = results.filter {
                    $0.type == "Trailer"
                }
                
                if filtered.count > 0 {
                    self?.obsVideo.accept(filtered[0])
                } else {
                    self?.obsVideo.accept(results[0])
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadReview() {
        
    }

	func requestTitle() {
        presenter?.set(title: "Movie Detail")
	}
}
