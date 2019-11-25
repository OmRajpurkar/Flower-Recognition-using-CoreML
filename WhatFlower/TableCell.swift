//
//  TableCell.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 23/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var thumbnailImageView: UIImageView!

    @IBOutlet var flowerLabel: UILabel!
    @IBOutlet var flowerImage: UIImageView!
    
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        nameLabel.text = nil
//        thumbnailImageView.image = nil
//    }

    // MARK: Cell Configuration

    func configurateTheCell(_ recipe: Region) {
        nameLabel.text = recipe.name
        thumbnailImageView.image = UIImage(named: recipe.thumbnails)
    }
    
    func configurateTheFlowerCell(_ flower: Flower) {
        flowerLabel.text = flower.name!
        flowerImage.image = UIImage(named: flower.image!)
    }

}
