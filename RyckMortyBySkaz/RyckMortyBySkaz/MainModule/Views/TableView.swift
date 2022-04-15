//
//  TableView.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import UIKit

class TableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: Private methods
extension TableView {
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        // tv.estimatedRowHeight = 1000
        self.rowHeight = UITableView.automaticDimension
        self.separatorColor = .secondarySystemBackground
        self.separatorStyle = .none
        self.dragInteractionEnabled = true
    }
}

