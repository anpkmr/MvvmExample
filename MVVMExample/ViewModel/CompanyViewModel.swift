//
//  DisheshViewModel.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import UIKit


class MovieDataFetchViewModel {
    
    
    func fetchMovies(completion:@escaping ([Movie])->()) {
        ClientService.shardService.fetchMoviesFromiTunes { (movieArr, error) in
            if error == nil {
                completion(movieArr as! [Movie])
            }
        }
    }
    
    
    
}

class MovieViewModel {
    
    var movieName:String = ""
    var accessoryType:UITableViewCellAccessoryType = .none
    
    init(company:Movie) {
        self.movieName = company.movieName
        if ((company.movieName.lowercased() == "Gotti") || (company.movieName.lowercased() == "samsung")) {
            accessoryType = .detailDisclosureButton
        } else {
            accessoryType = .none
        }
    }
    
}
