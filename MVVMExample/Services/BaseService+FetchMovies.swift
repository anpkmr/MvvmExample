//
//  BaseService+FetchMovies.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import ObjectMapper


extension ClientService {
    
    
    func fetchMoviesFromiTunes(closure:@escaping (_ resposne:Any?,_ error:Error?)->Void) {

        getRequest(requestUrl: URL(string:"https://itunes.apple.com/us/rss/topmovies/limit=25/json")!, requestParam: nil) { (response, error) in
            if error == nil {
                let feed = (response as! [String:Any])["feed"] as! [String : Any]
                let movies = Mapper<MoviewResponse>().map(JSON: feed)
                closure(movies?.movieArray, nil)
            } else {
                closure(nil, error)
            }
        }
    
    
    
//
//
//
    }
    
    
}
