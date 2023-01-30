//
//  MVHomePresenter.swift
//  Project: MovieDBRxViper
//
//  Module: MVHome
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

/// Should be conformed to by the `MVHomePresenter` and referenced by `MVHomeViewController`
protocol MVHomeViewPresenterProtocol: ViewPresenterProtocol {
    func getObsGenres() -> BehaviorRelay<MVGenreCollection>
    func loadGenres()
}

/// Should be conformed to by the `MVHomePresenter` and referenced by `MVHomeInteractor`
protocol MVHomeInteractorPresenterProtocol: AnyObject {
	/** Sets the title for the presenter
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func reloadData()
}

// MARK: -

/// The Presenter for the MVHome module
final class MVHomePresenter: MVHomeViewPresenterProtocol, MVHomeInteractorPresenterProtocol {
    func getObsGenres() -> BehaviorRelay<MVGenreCollection> {
        interactor.getObsGenres()
    }
    
    func loadGenres() {
        interactor.loadGenres()
    }
    
    
    func reloadData() {
        view?.reloadData()
    }
    

	// MARK: - Constants

	let router: MVHomePresenterRouterProtocol
	let interactor: MVHomePresenterInteractorProtocol

	// MARK: Variables

	weak var view: MVHomePresenterViewProtocol?

	// MARK: Inits

	init(router: MVHomePresenterRouterProtocol, interactor: MVHomePresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}

	// MARK: - MVHome View to Presenter Protocol

	func viewLoaded() {
		interactor.requestTitle()
	}

	// MARK: - MVHome Interactor to Presenter Protocol

	func set(title: String?) {
		view?.set(title: title)
	}
}
