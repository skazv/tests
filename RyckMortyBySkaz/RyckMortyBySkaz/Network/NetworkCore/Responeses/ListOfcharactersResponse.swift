//
//  Responses.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import Foundation


struct ListOfcharactersResponse: Responsable {
    let charachersArray: ResultsRaw
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let values = try container.decode(ResultsRaw.self)
        charachersArray = values
    }
}
