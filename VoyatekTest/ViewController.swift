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
    
    private let floatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(navigateToSecondScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        setupFloatingButton()
    }
    
    private func setupFloatingButton() {
        view.addSubview(floatingButton)
        NSLayoutConstraint.activate([
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            floatingButton.widthAnchor.constraint(equalToConstant: 100),
            floatingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func navigateToSecondScreen() {
        let secondScreen = UIHostingController(rootView: SecondScreenView())
//        self.show(secondScreen, sender: self)
        secondScreen.modalPresentationStyle = .fullScreen
                self.present(secondScreen, animated: true, completion: nil)
    }
}

// MARK: - Second Screen (SwiftUI)
struct SecondScreenView: View {
    var body: some View {
        VStack {
            Text("Second Screen")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Details")
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

