//
//  MVHomeInteractor.swift
//  Project: MovieDBRxViper
//
//  Module: MVHome
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

/// Should be conformed to by the `MVHomeInteractor` and referenced by `MVHomePresenter`
protocol MVHomePresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
    func getObsGenres() -> BehaviorRelay<MVGenreCollection>
    func loadGenres()

}

// MARK: -

/// The Interactor for the MVHome module
final class MVHomeInteractor: MVHomePresenterInteractorProtocol {
    
    func getObsGenres() -> BehaviorRelay<MVGenreCollection> {
        return obsGenres
    }
    

	// MARK: - Variables
    
    weak var presenter: MVHomeInteractorPresenterProtocol?

    var obsGenres = BehaviorRelay<MVGenreCollection>(value: MVGenreCollection(genres: []))
    var disposeBag = DisposeBag()
    
    init() {
        setupObserver()
    }
    
    func setupObserver() {
        _ = obsGenres.subscribe { _ in
            self.presenter?.reloadData()
        }.disposed(by: disposeBag)
    }
    
    func loadGenres() {
        APIManager.shared.fetchGenres { [weak self] response in
            switch response {
            case .success(let genres):
                self?.obsGenres.accept(genres)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

	// MARK: - MVHome Presenter to Interactor Protocol

	func requestTitle() {
		presenter?.set(title: "Movie Genres")
	}
}
