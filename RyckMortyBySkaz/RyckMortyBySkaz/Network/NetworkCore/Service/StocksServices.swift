//
//  Services.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import Foundation

protocol StocksServiceProtocol: AnyObject {
    func fetchListOfCharacters(comletion: @escaping (Swift.Result<[CharacterRaw], Error>) -> Void)
    func fetchCharacter(id: Int, comletion: @escaping (Swift.Result<CharacterRaw, Error>) -> Void)
}

class StocksService {
    private let network = NetworkCore.shared
}

extension StocksService: StocksServiceProtocol {
    func fetchCharacter(id: Int, comletion: @escaping (Result<CharacterRaw, Error>) -> Void) {
        let metadata = "character/\(id)"
        network.request(metadata: metadata) { (result: CoreResult<CharacterResponse>) in
            switch result {
            case .success(let respone):
                comletion(.success(respone.characher))
            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
    
    func fetchListOfCharacters(comletion: @escaping (Swift.Result<[CharacterRaw], Error>) -> Void) {
        let metadata = "character"
        network.request(metadata: metadata,
                        completion: { (result: CoreResult<ListOfcharactersResponse>) in
            switch result {
            case .success(let respones):
                comletion(.success(respones.charachersArray.results))
            case .failure(let error):
                comletion(.failure(error))
            }
        })
    }
    
    
    
}
