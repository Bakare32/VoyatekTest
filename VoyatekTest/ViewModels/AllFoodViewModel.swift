//
//  AllFoodViewModel.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import UIKit

typealias ObservablePlain = () -> Void
typealias Observable<T> = (T) -> Void

class AllFoodViewModel {
    
    var onSuccess: Observable<[AllFoodData]>?
    
    func fetchFoods() {
        guard let url = URL(string: "https://assessment.vgtechdemo.com/api/foods") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let foods = try JSONDecoder().decode(AllFoods.self, from: data)
                self.onSuccess?(foods.data)
            } catch {
                print("JSON decoding error: \(error)")
            }
        }
        task.resume()
    }
}
