//
//  Services.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import Foundation

protocol StocksServiceProtocol: AnyObject {
    func fetchListOfCharacters(comletion: @escaping (Swift.Result<[CharactersRaw], Error>) -> Void)
}

class StocksService {
    private let network = NetworkCore.shared
}

extension StocksService: StocksServiceProtocol {
    func fetchListOfCharacters(comletion: @escaping (Swift.Result<[CharactersRaw], Error>) -> Void) {
        let metadata = "character"
        network.request(metadata: metadata,
                        completion: { (result: CoreResult<ListOfcharactersResponse>) in
            switch result {
            case .success(let respones):
                comletion(.success(respones.charachersArray.results))
            case .failure(let error):
                print(error)
            }
        })
    }
}
