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

// MARK: Protocols

/// Should be conformed to by the `MVMovieDetailInteractor` and referenced by `MVMovieDetailPresenter`
protocol MVMovieDetailPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
}

// MARK: -

/// The Interactor for the MVMovieDetail module
final class MVMovieDetailInteractor: MVMovieDetailPresenterInteractorProtocol {

	// MARK: - Variables

	weak var presenter: MVMovieDetailInteractorPresenterProtocol?

	// MARK: - MVMovieDetail Presenter to Interactor Protocol

	func requestTitle() {
		presenter?.set(title: "MVMovieDetail")
	}
}
