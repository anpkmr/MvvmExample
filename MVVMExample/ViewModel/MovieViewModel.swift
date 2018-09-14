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
    
    init(movie:Movie) {
        self.movieName = movie.movieName
        if ((movie.movieName.lowercased() == "gotti") || (movie.movieName.lowercased() == "samsung")) {
            accessoryType = .detailDisclosureButton
        } else {
            accessoryType = .none
        }
    }
    
}
