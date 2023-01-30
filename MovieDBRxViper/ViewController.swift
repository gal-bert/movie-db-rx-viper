//
//  ViewController.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.fetchGenres { response in
            switch response {
            case .success(let genreList):
                guard let genreList = genreList.genres else { return }
                for genre in genreList {
                    print(genre.name)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }


}

