//
//  MVHomeRouter.swift
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

// MARK: Protocols

/// Should be conformed to by the `MVHomeRouter` and referenced by `MVHomePresenter`
protocol MVHomePresenterRouterProtocol: PresenterRouterProtocol {

}

// MARK: -

/// The Router for the MVHome module
final class MVHomeRouter: RouterProtocol, MVHomePresenterRouterProtocol {

	// MARK: - Variables

	weak var viewController: UIViewController?
}
