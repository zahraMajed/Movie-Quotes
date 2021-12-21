//
//  Movies.swift
//  Movie Quotes
//
//  Created by admin on 21/12/2021.
//

import Foundation
import UIKit

struct Movies {
    var movieName: String
    var movieImg: UIImage
    var movieQuestion:[MovieQuotes]
}

struct MovieQuotes {
    var answer:String
    var qute:String
}
