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

// MARK: Protocols

/// Should be conformed to by the `MVMovieListInteractor` and referenced by `MVMovieListPresenter`
protocol MVMovieListPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
}

// MARK: -

/// The Interactor for the MVMovieList module
final class MVMovieListInteractor: MVMovieListPresenterInteractorProtocol {

	// MARK: - Variables

	weak var presenter: MVMovieListInteractorPresenterProtocol?
    
    var genre: MVGenre?

	// MARK: - MVMovieList Presenter to Interactor Protocol

	func requestTitle() {
        if let genre = genre {
            presenter?.set(title: "\(genre.name) Movies")
        } else {
            presenter?.set(title: "Movie List")
        }
	}
}
