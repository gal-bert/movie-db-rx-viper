//
//  MVMovieListRouter.swift
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

/// Should be conformed to by the `MVMovieListRouter` and referenced by `MVMovieListPresenter`
protocol MVMovieListPresenterRouterProtocol: PresenterRouterProtocol {
    func pushToMovieDetail(movie: MVMovie)
}

// MARK: -

/// The Router for the MVMovieList module
final class MVMovieListRouter: RouterProtocol, MVMovieListPresenterRouterProtocol {

	// MARK: - Variables

	weak var viewController: UIViewController?
    
    func pushToMovieDetail(movie: MVMovie) {
        viewController?.navigationController?.pushViewController(MVMovieDetailModule(movie: movie).view, animated: true)
    }
    
}
