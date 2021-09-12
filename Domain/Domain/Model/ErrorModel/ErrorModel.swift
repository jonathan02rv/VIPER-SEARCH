//
//  ErrorModel.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

public enum ErrorModelType:String {
    case unknowError
    case networkError
    case httpError
    case mapperError
    case custom
}

public struct ErrorModel:Error {
    
    public var type: ErrorModelType
    public var description: String
    
    public init(type: ErrorModelType, description: String) {
        self.type = type
        self.description = description
    }
}
