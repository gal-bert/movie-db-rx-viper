//
//  MVMovieDetailViewController+Ext.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 31/01/23.
//

import UIKit

extension MVMovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") else { return UITableViewCell() }
        cell.textLabel?.text = obsReviews?.value[indexPath.row].content
        cell.detailTextLabel?.text = obsReviews?.value[indexPath.row].author_details?.username
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obsReviews?.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (obsReviews?.value.count ?? 0) - 4 {
            self.presenter.loadReviews()
        }
    }
    
}
