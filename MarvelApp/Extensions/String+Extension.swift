//
//  String+Extension.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit
import Foundation

extension String {
    
    func getMD5() -> Data {
        let messageData = self.data(using: .utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        return digestData
    }
    
}
