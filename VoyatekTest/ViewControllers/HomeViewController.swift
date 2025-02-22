//
//  HomeViewController.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    private let layout = HomeLayout()
    
    private let viewModel = AllFoodViewModel()
    
    var foods: [AllFoodData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewOnLoad()
        viewModel.fetchFoods()
    }
    
    private func setupViewOnLoad() {
        view.addSubview(layout)
        view.backgroundColor = .white
        layout.anchor(top: view.topAnchor,
                      leading: view.leadingAnchor,
                      bottom: view.bottomAnchor,
                      trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
        setupTableView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addTapped))
        layout.addView.addGestureRecognizer(tapGesture)
        layout.addView.isUserInteractionEnabled = true

        bind()
    }
    
    @objc func addTapped() {
        let secondScreen = UIHostingController(rootView: AddDetailsView(dismissAction: {
                    self.dismiss(animated: true, completion: nil)
                }))
        secondScreen.modalPresentationStyle = .fullScreen
        self.present(secondScreen, animated: true, completion: nil)
    }
    
    private func setupTableView() {
        layout.foodTable.register(FoodTableViewCell.self, forCellReuseIdentifier: "FoodCell")
        layout.foodTable.delegate = self
        layout.foodTable.dataSource = self
        
    }
    
    func bind() {
        viewModel.onSuccess = { [weak self] response in
            self?.foods = response
            DispatchQueue.main.async {
                self?.layout.foodTable.reloadData()
            }
        }
    }

}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FoodCell",
            for: indexPath
        ) as? FoodTableViewCell else {
            return UITableViewCell()
        }
        let food = foods[indexPath.row]
        cell.configure(with: food)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

