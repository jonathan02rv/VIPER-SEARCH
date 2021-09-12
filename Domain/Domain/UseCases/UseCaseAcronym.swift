//
//  UseCaseAcronym.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

public protocol UseCaseAcronymProtocol{
    
}

public struct UseCaseAcronym: UseCaseAcronymProtocol{
    var repository: RepositoryAcronymProtocol
    
    public init(repository: RepositoryAcronymProtocol) {
        self.repository = repository
    }
}
