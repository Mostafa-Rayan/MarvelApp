//
//  PersonWorkItemTests.swift
//  MarvelAppTests
//
//  Created by Mostafa Rayan on 9/5/20.
//

import XCTest
@testable import MarvelApp

class PersonWorkItemTests: XCTestCase {
    
    let defaultID = 12345
    
    func test_GetIDSucceeded() {
        let json = ["title": "Mostafa", "resourceURI": "http:mostafa.com/\(defaultID)"]
        if let personItem = PersonWorkItem(json){
            if let id = personItem.getId() {
                XCTAssert(id == defaultID, "Retrieved ID is wrong")
            }else{
                XCTFail("Error occured while getting ID")
            }
        }else{
            XCTFail("Error")
        }
    }
    
}
