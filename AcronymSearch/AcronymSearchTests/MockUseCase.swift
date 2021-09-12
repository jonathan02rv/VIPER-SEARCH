//
//  MockUseCase.swift
//  AcronymSearchTests
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 12/09/21.
//

import Foundation
import Domain

struct MockUseCase: UseCaseAcronymProtocol{
    func getMeaningAcronym(acronymText: String, completion: @escaping (Result<AcronymModel, ErrorModel>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 200) {
            completion(.success(getModelMock()))
        }
    }
    
    func getModelMock()->AcronymModel{
        var variants = [VariantModel]()
        variants.append(VariantModel(description: "heavy meromyosin", year: "1971"))
        var meaningList = [MeaningModel]()
        meaningList.append(MeaningModel(description: "heavy meromyosin", variantList: variants))
        return AcronymModel(name: "HMM", meaningList: meaningList)
    }
}
