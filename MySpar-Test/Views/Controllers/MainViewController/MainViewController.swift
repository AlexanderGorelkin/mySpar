//
//  MainViewController.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 13.08.2023.
//

import UIKit
enum Views {
    case history
    case promo
    case offers
    case product
}

class MainViewController: UIViewController {
    
    private let navBar = MainNavBar()
    
    
    lazy var scrollView = UIScrollView()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        return stackView
    }()
    
    private let historyView = HistoryView(array: [.init(image: UIImage(named: "1")!, title: "Hello"),
                                                                .init(image: UIImage(named: "1")!, title: "Hello"),
                                                                .init(image: UIImage(named: "1")!, title: "Hello"),
                                                                .init(image: UIImage(named: "1")!, title: "Hello"),
                                                                .init(image: UIImage(named: "1")!, title: "Hello"),
                                                                .init(image: UIImage(named: "1")!, title: "Hello"),
                                                                .init(image: UIImage(named: "1")!, title: "Hello"),
                                                                
    ])
    private let promoView = PromoView(array: [.init(promoImage: UIImage(named: "promoImage")!),
                                                            .init(promoImage: UIImage(named: "promoImage")!),
                                                            .init(promoImage: UIImage(named: "promoImage")!),
                                                            .init(promoImage: UIImage(named: "promoImage")!),
                                                            .init(promoImage: UIImage(named: "promoImage")!),
                                                            .init(promoImage: UIImage(named: "promoImage")!)])
    
    private let offerView = OffersView(array: [.init(promoImage: UIImage(named: "offerImage")!),
                                                             .init(promoImage: UIImage(named: "offerImage")!),
                                                             .init(promoImage: UIImage(named: "offerImage")!),
                                                             .init(promoImage: UIImage(named: "offerImage")!),
                                                             .init(promoImage: UIImage(named: "offerImage")!),
                                                             .init(promoImage: UIImage(named: "offerImage")!)])
    
    private let loyalityView = LoyalityView(with: .init(bonuses: 156, qrCode: UIImage(named: "1")!))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 20000)
        setupViews()
        constraintViews()
        configureAppearance()
        
    }
}
extension MainViewController {
    func setupViews() {
        view.addView(navBar)
        view.addView(scrollView)
        scrollView.addView(stackView)
        stackView.addArrangedSubview(historyView)
        stackView.addArrangedSubview(promoView)
        stackView.addArrangedSubview(offerView)
        stackView.addArrangedSubview(loyalityView)
        addProductView(productTitle: "Рекомендуем", productArray: [
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(199.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),])
        addProductView(productTitle: "Рекомендуем", productArray: [
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(199.90)),
            .init(eventTitle: nil, image: UIImage(named: "sparIceCream")!, price: Int(99.90)),])
    }
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 38),
            
            scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            historyView.heightAnchor.constraint(equalToConstant: 100),
            historyView.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            
            promoView.widthAnchor.constraint(equalToConstant: view.frame.width),
            promoView.heightAnchor.constraint(equalToConstant: 175),
            //
            offerView.widthAnchor.constraint(equalToConstant: view.frame.width),
            offerView.heightAnchor.constraint(equalToConstant: 90),
            
            loyalityView.heightAnchor.constraint(equalToConstant: 100),
            loyalityView.widthAnchor.constraint(equalToConstant: view.frame.width),
            //
            
                      
        ])
        
    }
    func configureAppearance() {
        view.backgroundColor = .white
    }
    
    
    func addProductView(productTitle: String, productArray: [ProductModel]) {
        let view = ProductView(with: productTitle, and: productArray)
        view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        stackView.addArrangedSubview(view)
        
    }
    
}


