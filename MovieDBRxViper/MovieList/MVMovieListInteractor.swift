//
//  MVMovieListInteractor.swift
//  Project: MovieDBRxViper
//
//  Module: MVMovieList
//
//  By Gregorius Albert 30/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import Foundation
import SwiftyVIPER
import RxSwift
import RxCocoa

// MARK: Protocols

/// Should be conformed to by the `MVMovieListInteractor` and referenced by `MVMovieListPresenter`
protocol MVMovieListPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
    func getObsMovies() -> BehaviorRelay<[MVMovie]>
    func loadMovies()
}

// MARK: -

/// The Interactor for the MVMovieList module
final class MVMovieListInteractor: MVMovieListPresenterInteractorProtocol {
    
    func getObsMovies() -> BehaviorRelay<[MVMovie]> {
        return obsMovies
    }
    

	// MARK: - Variables

	weak var presenter: MVMovieListInteractorPresenterProtocol?
    var obsMovies = BehaviorRelay<[MVMovie]>(value: [])
    var genre: MVGenre?
    
    var disposeBag = DisposeBag()
    
    init() {
        setupObserver()
    }
    
    func setupObserver() {
        _ = obsMovies.subscribe { _ in
            self.presenter?.reloadData()
        }.disposed(by: disposeBag)
    }
    
    func loadMovies() {
        APIManager.shared.fetchRelatedMovies(genreId: genre?.id ?? 0, page: 1) { [weak self] response in
            switch response {
            case .success(let movies):
                var moviesArr = self?.obsMovies.value
                moviesArr?.append(contentsOf: movies)
                if let moviesArr = moviesArr {
                    self?.obsMovies.accept(moviesArr)                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }

	// MARK: - MVMovieList Presenter to Interactor Protocol

	func requestTitle() {
        if let genre = genre {
            presenter?.set(title: "\(genre.name) Movies")
        } else {
            presenter?.set(title: "Movie List")
        }
	}
}
