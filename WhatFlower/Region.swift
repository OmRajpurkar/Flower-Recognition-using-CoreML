//
//  Recipe.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 23/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//
import Foundation

struct Region {
    let name: String
    let thumbnails: String
    let prepTime: String
}

extension Region {
    static func createRecipes() -> [Region] {
        return [Region(name: "Forest", thumbnails: "forest", prepTime: "1 hour"),
                Region(name: "Grassland", thumbnails: "grassland", prepTime: "30 min"),
                Region(name: "Desert", thumbnails: "desert", prepTime: "25 min"),
                Region(name: "Tundra", thumbnails: "tundra", prepTime: "15 min")
                //Region(name: "Ice Sheet", thumbnails: "icesheet", prepTime: "20 min")
        ]
    }
}
