//
//  FlowerTableViewController.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 23/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class FlowerTableViewController: UITableViewController {

    var flower = Flower.createFlower()
    let identifier: String = "tableCell"
    
    var flowerRegion = ""
    var newFlower = [Flower]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        for i in 0...(flower.count-1){
                if(flower[i].region! == flowerRegion){
                    newFlower.append(flower[i])
                }
        }
        
        self.title = flowerRegion + " Flowers"
    }
}

extension FlowerTableViewController {

    func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        tableView.reloadData()
    }

}

// MARK: - UITableView DataSource

extension FlowerTableViewController {

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newFlower.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell {
            cell.configurateTheFlowerCell(newFlower[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

}

// MARK: - UITableView Delegate

extension FlowerTableViewController {

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newFlower.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
}

// MARK: - Clicking on a particulat flower

extension FlowerTableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FlowerDetailViewController") as? FlowerDetailViewController
        
        vc?.image = newFlower[indexPath.row].image!
        vc?.name = newFlower[indexPath.row].name!
        vc?.info = newFlower[indexPath.row].info!
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
