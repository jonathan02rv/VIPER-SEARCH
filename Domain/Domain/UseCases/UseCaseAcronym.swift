//
//  UseCaseAcronym.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

public protocol UseCaseAcronymProtocol{
    func getMeaningAcronym(acronymText:String, completion: @escaping (Swift.Result<AcronymModel,ErrorModel>)->Void)
}

public struct UseCaseAcronym: UseCaseAcronymProtocol{
    var repository: RepositoryAcronymProtocol
    
    public init(repository: RepositoryAcronymProtocol) {
        self.repository = repository
    }
    
    public func getMeaningAcronym(acronymText:String, completion: @escaping (Swift.Result<AcronymModel,ErrorModel>)->Void){
        repository.getMeaningAcronym(acronymText: acronymText, completion: completion)
    }
}
