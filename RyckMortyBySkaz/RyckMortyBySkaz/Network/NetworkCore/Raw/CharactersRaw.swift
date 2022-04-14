//
//  CharactersRaw.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import Foundation

struct ResultsRaw: Codable {
    let results: [CharactersRaw]
}


struct CharactersRaw: Codable {
    let name: String
    let species: String
    let gender: String
    let image: String
}
