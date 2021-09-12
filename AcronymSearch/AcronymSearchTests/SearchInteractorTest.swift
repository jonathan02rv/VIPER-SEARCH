//
//  SearchInteractorTest.swift
//  AcronymSearchTests
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 12/09/21.
//

import XCTest
@testable import AcronymSearch

class SearchInteractorTest:XCTestCase{
    
    func test_init_beforeTheFirstRequest(){
        let interactor = makeInteractor()
        XCTAssertNil(interactor.workItem)
    }
    
    func test_init_afterFirstRequest(){
        let interactor = makeInteractor()
        interactor.getMeaningAcronym(acronymText: "HMM")
        XCTAssertNotNil(interactor.workItem)
    }
    
    func test_loadTwiceRequest(){
        var workItems = [DispatchWorkItem]()
        let interactor = makeInteractor()
        interactor.getMeaningAcronym(acronymText: "H")
        workItems.append(interactor.workItem!)
        interactor.getMeaningAcronym(acronymText: "HM")
        workItems.append(interactor.workItem!)
        XCTAssertTrue(workItems[0].isCancelled)
        XCTAssertFalse(workItems[1].isCancelled)
    }
    
    func test_loadThreeTimesRequest(){
        var workItems = [DispatchWorkItem]()
        let interactor = makeInteractor()
        interactor.getMeaningAcronym(acronymText: "H")
        workItems.append(interactor.workItem!)
        interactor.getMeaningAcronym(acronymText: "HM")
        workItems.append(interactor.workItem!)
        interactor.getMeaningAcronym(acronymText: "HMM")
        workItems.append(interactor.workItem!)
        XCTAssertTrue(workItems[0].isCancelled)
        XCTAssertTrue(workItems[1].isCancelled)
        XCTAssertFalse(workItems[2].isCancelled)
    }
    
    
    //MARK: - Helpers
    func makeInteractor()->SearchInteractor{
        return SearchInteractor(useCase: MockUseCase())
    }

}
