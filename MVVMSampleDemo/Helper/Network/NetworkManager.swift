//
//  NetworkManager.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import Moya

enum ApiEnvironmentURL:String {
    case baseUrl = ""
}

let nm = NetworkManager()

struct NetworkManager{
    static let environmentBaseURL = ApiEnvironmentURL.baseUrl.rawValue
    var dataservide = MoyaProvider<MVVMSercive>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .default))])
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
