//
//  MVMovieDetailModule.swift
//  Project: MovieDBRxViper
//
//  Module: MVMovieDetail
//
//  By Gregorius Albert 31/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import SwiftyVIPER
import UIKit

// MARK: -

/// Used to initialize the MVMovieDetail VIPER module
final class MVMovieDetailModule: ModuleProtocol {

	// MARK: - Variables

	private(set) lazy var interactor: MVMovieDetailInteractor = {
		MVMovieDetailInteractor()
	}()

	private(set) lazy var router: MVMovieDetailRouter = {
		MVMovieDetailRouter()
	}()

	private(set) lazy var presenter: MVMovieDetailPresenter = {
		MVMovieDetailPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: MVMovieDetailViewController = {
		MVMovieDetailViewController(presenter: self.presenter)
	}()

	// MARK: - Module Protocol Variables

	var viewController: UIViewController {
		return view
	}

	// MARK: Inits

	init() {
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
	}
}
