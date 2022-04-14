//
//  ViewController.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    private let stocksService = StocksService()
    private let tableView = TableView()
    private let customCellId = "custumCell"
    private var characters: [CharacterViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        setup()
        
        stocksService.fetchListOfCharacters { [self] result in
            switch result {
            case .success(let raws):
                characters = makeViewModel(charactersRaw: raws)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func makeViewModel(charactersRaw: [CharactersRaw]) -> [CharacterViewModel] {
        var character: [CharacterViewModel] = []
        
        character = charactersRaw.map({ caracterRaw in
            return CharacterViewModel(name: caracterRaw.name, species: caracterRaw.species , gender: caracterRaw.gender, imageUrl: caracterRaw.image)
        })
        
        return character
    }
    
}

//MARK: - Private methods
extension MainViewController {
    private func setup() {
        view.backgroundColor = .secondarySystemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: customCellId)
        
    }
    
}

// MARK: - Protocols UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as? CustomCell
        else { return UITableViewCell() }
        let model = characters[indexPath.row]
        
        let imageLoader = ImageLoader()
        
        
            if let url = URL(string: model.imageUrl) {
                imageLoader.loadImage(by: url, completion: { newImage in
                    if let image = newImage {
                        cell.cellInit(name: model.name, image: image, species: model.species, gender: model.gender)
                    }
                })
            }
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ProfileController(), animated: true)
    }
    
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
}
