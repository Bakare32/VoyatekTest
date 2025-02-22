////
////  ViewController.swift
////  VoyatekTest
////
////  Created by Bakare Waris on 21/02/2025.
////


import UIKit
import SwiftUI

// MARK: - First Screen (UIKit)
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}

// MARK: - Entry Point
@main
struct iOSDeveloperTestApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FirstViewControllerWrapper()
            }
        }
    }
}

// Wrapper to host UIKit in SwiftUI with Navigation
struct FirstViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let navController = UINavigationController(rootViewController: ViewController())
        return navController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

