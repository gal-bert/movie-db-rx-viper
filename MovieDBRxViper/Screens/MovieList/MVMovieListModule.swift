//
//  MVMovieListModule.swift
//  Project: MovieDBRxViper
//
//  Module: MVMovieList
//
//  By Gregorius Albert 30/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import SwiftyVIPER
import UIKit

// MARK: -

/// Used to initialize the MVMovieList VIPER module
final class MVMovieListModule: ModuleProtocol {

	// MARK: - Variables

	private(set) lazy var interactor: MVMovieListInteractor = {
		MVMovieListInteractor()
	}()

	private(set) lazy var router: MVMovieListRouter = {
		MVMovieListRouter()
	}()

	private(set) lazy var presenter: MVMovieListPresenter = {
		MVMovieListPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: MVMovieListViewController = {
		MVMovieListViewController(presenter: self.presenter)
	}()

	// MARK: - Module Protocol Variables

	var viewController: UIViewController {
		return view
	}

	// MARK: Inits

    init(genre: MVGenre) {
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
        interactor.genre = genre
	}
}
