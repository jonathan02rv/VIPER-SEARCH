//
//  AcronymRequest.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

internal struct RequestOBjectAcronyms: RequestObject{
    var path: String = "/software/acromine/dictionary.py?sf="
    var method: HTTPMethod = .get
    var headers: HTTPHeaders
    var parameters: Parameters = [:]
    
    init(acronym:String) {
        headers = headerDefault
        self.path += acronym
    }
}
