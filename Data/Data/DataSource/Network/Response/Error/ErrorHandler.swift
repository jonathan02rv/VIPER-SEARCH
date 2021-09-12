//
//  ErrorHandler.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain

enum ErrorServiceType:String{
    case unknowError
    case networkError
    case httpError
    case mapperError
    case custom
}

struct ErrorEntity: Error{
    let typeError: ErrorServiceType
    let reason: String
    
    static func maper(errorData: ErrorEntity) -> ErrorModel {
        return ErrorModel(type: ErrorModelType(rawValue: errorData.typeError.rawValue) ?? .unknowError, description: errorData.reason)
    }
}

struct ErrorHandler{
    static func get(code:String?,description:String)->ErrorEntity{
        guard let code = code else{
            return ErrorEntity(typeError: .unknowError, reason: NSLocalizedString("defaultError", comment: "defaultError"))
        }
        return ErrorEntity(typeError: ErrorServiceType(rawValue: code) ?? .custom, reason: description)
    }
    
    static func get(type: ErrorServiceType, description:String?)->ErrorEntity{
        return ErrorEntity(typeError: type, reason: description ?? NSLocalizedString("defaultError", comment: "defaultError"))
    }

}
