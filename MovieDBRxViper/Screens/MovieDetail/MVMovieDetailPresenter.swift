//
//  MVMovieDetailPresenter.swift
//  Project: MovieDBRxViper
//
//  Module: MVMovieDetail
//
//  By Gregorius Albert 31/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import UIKit

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `MVMovieDetailPresenter` and referenced by `MVMovieDetailViewController`
protocol MVMovieDetailViewPresenterProtocol: ViewPresenterProtocol {
    func getMovie() -> MVMovie
}

/// Should be conformed to by the `MVMovieDetailPresenter` and referenced by `MVMovieDetailInteractor`
protocol MVMovieDetailInteractorPresenterProtocol: AnyObject {
	/** Sets the title for the presenter
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    
}

// MARK: -

/// The Presenter for the MVMovieDetail module
final class MVMovieDetailPresenter: MVMovieDetailViewPresenterProtocol, MVMovieDetailInteractorPresenterProtocol {
    
    

	// MARK: - Constants

	let router: MVMovieDetailPresenterRouterProtocol
	let interactor: MVMovieDetailPresenterInteractorProtocol

	// MARK: Variables

	weak var view: MVMovieDetailPresenterViewProtocol?

	// MARK: Inits

	init(router: MVMovieDetailPresenterRouterProtocol, interactor: MVMovieDetailPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}

	// MARK: - MVMovieDetail View to Presenter Protocol

	func viewLoaded() {
		interactor.requestTitle()
	}
    
    func getMovie() -> MVMovie {
        interactor.getMovie()
    }

	// MARK: - MVMovieDetail Interactor to Presenter Protocol

	func set(title: String?) {
		view?.set(title: title)
	}
    
}
