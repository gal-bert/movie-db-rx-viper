//
//  MVMovieDetailRouter.swift
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

/// Should be conformed to by the `MVMovieDetailRouter` and referenced by `MVMovieDetailPresenter`
protocol MVMovieDetailPresenterRouterProtocol: PresenterRouterProtocol {

}

// MARK: -

/// The Router for the MVMovieDetail module
final class MVMovieDetailRouter: RouterProtocol, MVMovieDetailPresenterRouterProtocol {

	// MARK: - Variables

	weak var viewController: UIViewController?
}
