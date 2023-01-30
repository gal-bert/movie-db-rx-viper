//
//  MVHomeViewController+Ext.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import UIKit

extension MVHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = obsGenres?.value.genres[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obsGenres?.value.genres.count ?? 0
    }
    
    
}
