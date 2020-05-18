//
//  MarvelError.swift
//  MarvelAPI
//
//  Created by Onurcan Yurt on 17.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation


// MARK: - MarvelError

public enum MarvelError: Error {
    case url(error: URLError)
    case decoder(error: Error)
    case network
}
