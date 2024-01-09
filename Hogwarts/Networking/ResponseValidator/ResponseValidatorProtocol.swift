//
//  ResponseValidatorProtocol.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

protocol ResponseValidatorProtocol {
    func validation<T: Decodable>(data: Data, response: HTTPURLResponse?) throws -> T
}
