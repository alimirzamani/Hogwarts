//
//  HTTPClient.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

protocol HTTPClient {
    var responseValidator: ResponseValidatorProtocol { get set }
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
    func modifyQueryParams(url: inout URL, parameters: Encodable) throws
    func queryItems(from encodable: Encodable) throws -> [URLQueryItem]
}

extension HTTPClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        var url = endpoint.url

        let method = endpoint.method
        let parameters = endpoint.parameters

        if let parameters, method == .get || method == .delete {
            try modifyQueryParams(url: &url, parameters: parameters)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let parameters, method == .post || method == .put {
            request.httpBody = try jsonEncodedData(parameters)
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        return try responseValidator.validation(data: data, response: response as? HTTPURLResponse)
    }

    func modifyQueryParams(url: inout URL, parameters: Encodable) throws {
        let queryItems = try queryItems(from: parameters)

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryItems

        guard let urlWithParams = urlComponents?.url else {
            throw RequestError.invalidRequest
        }

        url = urlWithParams
    }

    func queryItems(from encodable: Encodable) throws -> [URLQueryItem] {
        let data = try jsonEncodedData(encodable)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] else {
            throw RequestError.invalidRequest
        }

        return dictionary.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
    }

    func jsonEncodedData(_ encodable: Encodable) throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(encodable)
    }
}
