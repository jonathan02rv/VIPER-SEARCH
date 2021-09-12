//
//  RepositoryAcronymProtocol.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation


public protocol RepositoryAcronymProtocol{
    func getMeaningAcronym(acronymText:String, completion: @escaping (Swift.Result<AcronymModel,Error>)->Void)
}
