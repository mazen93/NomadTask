//
//  RequestConstants.swift
//  AbsherInterior
//
//  Created by Elsayed Hussein on 9/19/21.
//

import Foundation

struct Urls {

    static var baseURL = "https://run.mocky.io/"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLanguage = "Accept-Language"
}

enum ContentType: String {
    case json = "application/json"
}
