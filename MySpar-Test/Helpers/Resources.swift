//
//  Resources.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 13.08.2023.
//

import UIKit


struct R {
    enum TabBarItems {
        static func title(tab: Tabs) -> String {
            switch tab {
            case .main:
                return "Главная"
            case .catalog:
                return "Каталог"
            case .cart:
                return "Корзина"
            case .profile:
                return "Профиль"
            }
        }
        static func image(tab: Tabs) -> UIImage? {
            switch tab {
            case .main:
                return UIImage(named: "sparLogo")
            case .catalog:
                return UIImage(systemName: "square.grid.2x2")
            case .cart:
                return UIImage(systemName: "cart")
            case .profile:
                return UIImage(systemName: "person")
            }
        }
    }
    enum Colors {
        static let sparGreen: UIColor = UIColor(red: 21/255, green: 183/255, blue: 66/255, alpha: 1)
        static let sparGray: UIColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        
    }
}
