//
//  RepositoryAcronym.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain

public struct RepositoryAcronym: RepositoryAcronymProtocol{
    
    private let networkDataSource: DataSourceNetworkProtocol
    
    public init(){
        self.networkDataSource = DataSourceNetwork()
    }
    
    public func getMeaningAcronym(acronymText:String, completion: @escaping (Swift.Result<AcronymModel,ErrorModel>)->Void){
        
        let request = RequestOBjectAcronyms(acronym: acronymText)
        networkDataSource.getMeaningAcronym(request: request) { (result) in
            switch result{
            case .success(let data):
                completion(.success(AcronymEntity.maper(data: data)))
            case .failure(let error):
                completion(.failure(ErrorEntity.maper(errorData: error)))
            }
        }
    }
}
