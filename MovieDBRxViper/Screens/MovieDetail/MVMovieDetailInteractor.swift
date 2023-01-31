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
    func getMovie() -> MVMovie
}

// MARK: -

/// The Interactor for the MVMovieDetail module
final class MVMovieDetailInteractor: MVMovieDetailPresenterInteractorProtocol {

	// MARK: - Variables

	weak var presenter: MVMovieDetailInteractorPresenterProtocol?
    
    var movie: MVMovie?
    var disposeBag = DisposeBag()
    
    init() {
        setupObserver()
    }
        
    func setupObserver(){
//        _ = obsMovie.subscribe { _ in
//            self.presenter?.configure(with: obsMovie)
//        }.disposed(by: disposeBag)
    }

	// MARK: - MVMovieDetail Presenter to Interactor Protocol
    
//    func getObsMovie() -> BehaviorRelay<MVMovie> {
//        return obsMovie
//    }
    
    func getMovie() -> MVMovie {
        return movie ?? MVMovie()
    }
    
    func loadVideo() {
        
    }
    
    func loadReview() {
        
    }

	func requestTitle() {
        presenter?.set(title: "Movie Detail")
	}
}
