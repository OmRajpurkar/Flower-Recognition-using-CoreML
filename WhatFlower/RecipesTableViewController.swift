//
//  RecipesTableViewController.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 23/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation

import UIKit

class FlowerTableViewController: UITableViewController {

    var recipes = Region.createRecipes()
    let identifier: String = "tableCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail",
            let indexPath = tableView?.indexPathForSelectedRow,
            let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
            destinationViewController.recipe = recipes[indexPath.row]
        }
    }

}

extension FlowerTableViewController {

    func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationItem.title = "Recipes"
        tableView.reloadData()
    }

}

// MARK: - UITableView DataSource

extension FlowerTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell {
            cell.configurateTheCell(recipes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

}

// MARK: - UITableView Delegate

extension FlowerTableViewController {

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }

}
