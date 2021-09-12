//
//  DataSourceNetworkProtocol.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

protocol DataSourceNetworkProtocol {
    func getMeaningAcronym(acronymText:String, completion: @escaping (Swift.Result<AcronymEntity,ErrorEntity>)->Void)
}
