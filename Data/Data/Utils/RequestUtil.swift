//
//  RequestUtil.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

struct RequestUtil{
    
    static func getUrlRequest(urlService: String, request: RequestObject)-> URLRequest?{
        guard let url = URL(string: "\(urlService)") else{return nil}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        request.headers.forEach { (item) in
            urlRequest.setValue(item.value, forHTTPHeaderField: item.key)
        }
        return urlRequest
    }
    
    static func getJSONData(params: [String:Any])->Data?{
        let jsonData = try? JSONSerialization.data(withJSONObject: params, options: [.prettyPrinted])
        return jsonData
    }
}
