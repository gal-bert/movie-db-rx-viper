//
//  MVMovieListPresenter.swift
//  Project: MovieDBRxViper
//
//  Module: MVMovieList
//
//  By Gregorius Albert 30/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import UIKit
import SwiftyVIPER
import RxSwift
import RxCocoa

// MARK: Protocols

/// Should be conformed to by the `MVMovieListPresenter` and referenced by `MVMovieListViewController`
protocol MVMovieListViewPresenterProtocol: ViewPresenterProtocol {
    func getObsMovies() -> BehaviorRelay<[MVMovie]>
    func loadMovies()
    func pushToMovieDetail()
}

/// Should be conformed to by the `MVMovieListPresenter` and referenced by `MVMovieListInteractor`
protocol MVMovieListInteractorPresenterProtocol: AnyObject {
	/** Sets the title for the presenter
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func reloadData()
}

// MARK: -

/// The Presenter for the MVMovieList module
final class MVMovieListPresenter: MVMovieListViewPresenterProtocol, MVMovieListInteractorPresenterProtocol {


	// MARK: - Constants

	let router: MVMovieListPresenterRouterProtocol
	let interactor: MVMovieListPresenterInteractorProtocol

	// MARK: Variables

	weak var view: MVMovieListPresenterViewProtocol?

	// MARK: Inits

	init(router: MVMovieListPresenterRouterProtocol, interactor: MVMovieListPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}

	// MARK: - MVMovieList View to Presenter Protocol

	func viewLoaded() {
		interactor.requestTitle()
	}
    
    func getObsMovies() -> BehaviorRelay<[MVMovie]> {
        interactor.getObsMovies()
    }
    
    func loadMovies() {
        interactor.loadMovies()
    }
    
    func pushToMovieDetail() {
        router.pushToMovieDetail()
    }

	// MARK: - MVMovieList Interactor to Presenter Protocol

	func set(title: String?) {
		view?.set(title: title)
	}
    
    func reloadData() {
        view?.reloadData()
    }
    
}
