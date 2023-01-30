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
                for genre in genreList.genres {
                    print(genre.name)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }


}

