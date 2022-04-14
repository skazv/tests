//
//  UIView+Extensions.swift
//  RyckMortyBySkaz
//
//  Created by Suren Kazaryan on 14.04.2022.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
