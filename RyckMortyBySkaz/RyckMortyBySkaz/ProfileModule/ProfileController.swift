//
//  DetailViewController.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import UIKit

class ProfileController: UIViewController {
    let profileView = ProfileView()
    private let stocksService = StocksService()
    var id: Int?

    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .secondarySystemBackground
        setup()
    }
    
    init(id: Int) {
        super.init(nibName: nil, bundle: nil)
        self.id = id
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

//MARK: - Private methods
extension ProfileController {
    private func setup() {
        guard let id = id else { return }
        stocksService.fetchCharacter(id: id) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.profileView.updateView(name: response.name,
                                                species: response.species,
                                                gender: response.gender,
                                                status: response.status,
                                                lastLocation: response.episode.last ?? "0")
                    
                    DispatchQueue.global().async {
                        let imageLoader = ImageLoader()
                        if let url = URL(string: response.image) {
                                imageLoader.loadImage(by: url, completion: { newImage in
                                    if let image = newImage {
                                        self.profileView.updateImage(image: image)
                                        self.profileView.activityIndicator.stopAnimating()
                                    }
                                })
                            }
                    }
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
