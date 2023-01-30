//
//  MVMovieDetailViewController.swift
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

/// Should be conformed to by the `MVMovieDetailViewController` and referenced by `MVMovieDetailPresenter`
protocol MVMovieDetailPresenterViewProtocol: AnyObject {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}

// MARK: -

/// The View Controller for the MVMovieDetail module
class MVMovieDetailViewController: UIViewController, MVMovieDetailPresenterViewProtocol {

	// MARK: - Constants

	let presenter: MVMovieDetailViewPresenterProtocol

	// MARK: Variables
    
    let movieDetailView = MVMovieDetailView()

	// MARK: Inits

	init(presenter: MVMovieDetailViewPresenterProtocol) {
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
        movieDetailView.setup(vc: self)
        
    }
    
    override func loadView() {
        self.view = movieDetailView
    }

	// MARK: - MVMovieDetail Presenter to View Protocol

	func set(title: String?) {
		self.title = title
	}
}
