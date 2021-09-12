//
//  AcronymEntity.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain

struct AcronymEntity:Codable{
    let sf:String
    let lfs: [MeaningEntity]
}


struct MeaningEntity:Codable{
    let lf:String
    let vars: [VariantEntity]
}


struct VariantEntity:Codable{
    let lf: String
    let since: String
}

//MARK: - Mapper extension

extension AcronymEntity{
    static func maper(data: AcronymEntity)->AcronymModel{
        AcronymModel(name: data.sf, meaningList: MeaningEntity.maper(data: data.lfs))
    }
}

extension MeaningEntity{
    static func maper(data: [MeaningEntity])->[MeaningModel]{
        data.map{
            MeaningModel(description: $0.lf, variantList: VariantEntity.maper(data: $0.vars))
        }
    }
}

extension VariantEntity{
    static func maper(data: [VariantEntity])->[VariantModel]{
        data.map{
            VariantModel(description: $0.lf, year: $0.since)
        }
    }
}
