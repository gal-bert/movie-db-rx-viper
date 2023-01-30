//
//  MVHomeViewController.swift
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

/// Should be conformed to by the `MVHomeViewController` and referenced by `MVHomePresenter`
protocol MVHomePresenterViewProtocol: AnyObject {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func reloadData()
}

// MARK: -

/// The View Controller for the MVHome module
class MVHomeViewController: UIViewController, MVHomePresenterViewProtocol {

	// MARK: - Constants

	let presenter: MVHomeViewPresenterProtocol

	// MARK: Variables
    
    let homeView = HomeView()
    var obsGenres: BehaviorRelay<MVGenreCollection>?

	// MARK: Inits

	init(presenter: MVHomeViewPresenterProtocol) {
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
        homeView.setup(vc: self)
        obsGenres = presenter.getObsGenres()
        presenter.loadGenres()
    }
    
    override func loadView() {
        self.view = homeView
    }

	// MARK: - MVHome Presenter to View Protocol

	func set(title: String?) {
		self.title = title
	}
    
    func reloadData() {
        DispatchQueue.main.async {
            self.homeView.tableView.reloadData()
        }
    }
    
}
