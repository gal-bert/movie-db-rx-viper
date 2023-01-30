//
//  MVHomeModule.swift
//  Project: MovieDBRxViper
//
//  Module: MVHome
//
//  By Gregorius Albert 30/01/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import SwiftyVIPER
import UIKit

// MARK: -

/// Used to initialize the MVHome VIPER module
final class MVHomeModule: ModuleProtocol {

	// MARK: - Variables

	private(set) lazy var interactor: MVHomeInteractor = {
		MVHomeInteractor()
	}()

	private(set) lazy var router: MVHomeRouter = {
		MVHomeRouter()
	}()

	private(set) lazy var presenter: MVHomePresenter = {
		MVHomePresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: MVHomeViewController = {
		MVHomeViewController(presenter: self.presenter)
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
