//
//  DetailViewController.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 23/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    var recipe: Region?
    var flower: Flower?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let recipe = recipe {
            navigationItem.title = recipe.name
            imageView.image = UIImage(named: recipe.thumbnails)
            nameLabel.text = recipe.name
        }
    }
}
