//
//  AcronymModel.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation


public struct AcronymModel{
    public let name:String
    public let meaningList: [MeaningModel]
    
    public init(name:String, meaningList: [MeaningModel]){
        self.name = name
        self.meaningList = meaningList
    }
}


public struct MeaningModel{
    public let description:String
    public let variantList: [VariantModel]
    
    public init(description:String, variantList: [VariantModel]) {
        self.description = description
        self.variantList = variantList
    }
}


public struct VariantModel{
    public let description: String
    public let year: String
    
    public init(description: String, year: String){
        self.description = description
        self.year = year
    }
}
