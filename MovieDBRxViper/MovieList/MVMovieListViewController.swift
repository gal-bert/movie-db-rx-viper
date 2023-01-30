//
//  MVMovieListViewController.swift
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

// MARK: Protocols

/// Should be conformed to by the `MVMovieListViewController` and referenced by `MVMovieListPresenter`
protocol MVMovieListPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}

// MARK: -

/// The View Controller for the MVMovieList module
class MVMovieListViewController: UIViewController, MVMovieListPresenterViewProtocol {

	// MARK: - Constants

	let presenter: MVMovieListViewPresenterProtocol

	// MARK: Variables
    
    let movieListView = MVMovieListView()

	// MARK: Inits

	init(presenter: MVMovieListViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Load Functions

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter.viewLoaded()
        movieListView.setup(vc: self)
		view.backgroundColor = .white
    }
    
    override func loadView() {
        self.view = movieListView
    }

	// MARK: - MVMovieList Presenter to View Protocol

	func set(title: String?) {
		self.title = title
	}
}
