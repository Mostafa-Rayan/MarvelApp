//
//  MarvelAPITests.swift
//  MarvelAppTests
//
//  Created by Mostafa Rayan on 9/5/20.
//

import XCTest
@testable import MarvelApp

class MarvelAPITests: XCTestCase {
    
    //MARK:- Constants & Variables
    let baseURL = "https://gateway.marvel.com/v1/public"
    let publicAPIKey = "123"
    let privateAPIKey = "456"
    var api:MarvelAPI!
    
    //MARK:- Methods
    override func setUp() {
        super.setUp()
        self.api = MarvelAPI(baseURL: self.baseURL, privateKey: self.privateKey, publicKey: self.publicKey)
    }
    
    override func tearDown() {
        api = nil
    }
    
    func test_AuthenticationParams() {
        let hashApi = MarvelAPI.requestHash(timestamp: "NOW", apiPrivateKey: self.privateKey, apiPublicKey: self.publicKey)
        let parameters = MarvelAPI.authenticationParameters(privateKey: self.privateKey, publicKey: self.publicKey, timestamp: "NOW")
        if let apikey = parameters["apikey"] {
            XCTAssert(apikey == self.publicKey, "apiKey isn't publicKey")
        }else{
            XCTFail("Error with apikey")
        }
    }
    
}
