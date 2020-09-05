//
//  Constants.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation

public enum Constants{
    
    public enum API {
        static let baseAddress = "https://gateway.marvel.com/v1/public"
        static let publicKey = "889cd8f13af6fe99bc57ebf1800840d6"
        static let privateKey = "11d12019bdeaeb8ab53c6c607cafcae3ca6ed88f"
    }
    
    public enum Cell {
        static let charactersList = "cellList"
        static let characterDetails = "cellDetail"
    }
    
    static let debugMode = false
    
}
