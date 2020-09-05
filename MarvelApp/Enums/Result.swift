//
//  Result.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation

public enum Result<T>: Error {
    case success(object: T)
    case failure(message: String)
}
