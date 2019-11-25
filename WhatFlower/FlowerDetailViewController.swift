//
//  FlowerDetailViewController.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 24/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class FlowerDetailViewController: UIViewController {

    @IBOutlet var flowerName: UILabel!
    @IBOutlet var flowerImage: UIImageView!
    @IBOutlet var flowerInfo: UITextView!
    
    var name = ""
    var image = ""
    var info = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowerName.text = name
        print(image)
        flowerImage.image = UIImage(named: image)
        flowerInfo.text = info
        // Do any additional setup after loading the view.
    }

}
