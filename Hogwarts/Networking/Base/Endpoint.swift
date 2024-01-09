//
//  Endpoint.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var basePath: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Encodable? { get }
}

extension Endpoint {

    /// Full url of endpoint
    var url: URL {
        URL(string: baseURL + basePath + path)!
    }
}
