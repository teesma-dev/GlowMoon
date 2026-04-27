//
//  View+Extensions.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        DispatchQueue.main.async {
            if let tabBarController = viewController.tabBarController {
                self.callback(tabBarController.tabBar)
            }
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

extension View {
    func setTabBarHidden(_ hidden: Bool) -> some View {
        self.background(TabBarAccessor { tabBar in
            tabBar.isHidden = hidden
        })
    }
}
