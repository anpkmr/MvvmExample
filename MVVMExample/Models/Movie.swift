//
//  Dishesh.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviewResponse:Mappable {
    var movieArray = [Movie]()
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        movieArray <- map["entry"]
    }
}

class Movie: Mappable {
    var movieName:String = ""
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        movieName <- map["im:name.label"]
    }
}
