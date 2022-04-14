//
//  NetworkErrors.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case handleDataResponesError
    case responseDecodingError
    case noInternet
    case fuckup
}
