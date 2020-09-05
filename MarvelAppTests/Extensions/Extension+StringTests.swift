//
//  Extension+StringTests.swift
//  MarvelAppTests
//
//  Created by Mostafa Rayan on 9/5/20.
//

import XCTest
@testable import MarvelApp

class StringExtensionTests: XCTestCase {
    
    func testMD5() {
        let string = "itg"
        let md5 = string.getMD5().map { String(format: "%02hhx", $0) }.joined()
        
        XCTAssert(md5 == "90792de52961c34118f976ebe4af3a75", "MD5 fails")
    }
    
}
