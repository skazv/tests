//
//  CharactersRaw.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import Foundation

struct ResultsRaw: Codable {
    let results: [CharacterRaw]
}


struct CharacterRaw: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let episode: [String]
}
