//
//  DataSourceNetwork.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation


struct DataSourceNetwork: DataSourceNetworkProtocol{
    
    let urlSessionConfiguration = URLSessionConfiguration.default
    let urlSession: URLSession!
    let urlBase:String
    
    init() {
        urlSessionConfiguration.timeoutIntervalForRequest = 15.0
        urlSessionConfiguration.timeoutIntervalForResource = 30.0
        urlSession = URLSession(configuration: self.urlSessionConfiguration)
        urlBase = AppEnvironment.serverBaseUrl
    }
    
    func getMeaningAcronym(request: RequestObject, completion: @escaping (Swift.Result<AcronymEntity, ErrorEntity>) -> Void) {
        
        let urlService = urlBase + request.path
        guard let urlRequest = RequestUtil.getUrlRequest(urlService: urlService, request: request) else{return}
        
        urlSession.dataTask(with: urlRequest){ (data, response, error) in
            
            let responseString = String(data: data ?? Data(), encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            debugPrint("RESPONSE: \(responseString ?? "")")
            
            guard let dataResponse = try? JSONDecoder().decode(AcronymEntity.self, from: data ?? Data()) else{
                print("parse error")
                completion(.failure(ErrorHandler.get(type: .mapperError, description: error?.localizedDescription)))
                return
            }
            print("parse SUCCESS")
            completion(.success(dataResponse))
            
        }.resume()
    }
}
