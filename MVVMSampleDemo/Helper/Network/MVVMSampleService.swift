//
//  MVVMSampleService.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import Moya
import Alamofire

public enum MVVMSercive {
    
    case resource
    
}

extension MVVMSercive : TargetType {
    
    public var baseURL: URL {
        guard let url = URL(string: NetworkManager.environmentBaseURL) else {fatalError("Base url could not be configured")}
        return url
    }
    
    public var path: String {
        switch self {
        case .resource:
            return "resbycat"
        }
    }
    
    public var method: Moya.Method {
        switch self {
            
        case .resource:
            return .get
        default :
            return .post
            
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .resource:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Accept" : "application/json"]
    }
}

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
