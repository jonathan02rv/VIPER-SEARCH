//
//  AcronymEntity.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

struct AcronymEntity{
    let sf:String
    let lfs: [MeaningEntity]
}


struct MeaningEntity{
    let lf:String
    let vars: [VariantEntity]
}


struct VariantEntity{
    let lf: String
    let since: String
}

