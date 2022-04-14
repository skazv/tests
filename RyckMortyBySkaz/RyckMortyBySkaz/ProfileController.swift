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

    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .secondarySystemBackground
        profileView.updateView(name: "asdasad", image: .add)
    }


}
