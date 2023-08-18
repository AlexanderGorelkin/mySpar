//
//  ProductCollectionViewCell.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    private let productImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "sparIceCream")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    private var stackView = ProductStackView(priceLabel: "\(199.99)")
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = 15
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension ProductCollectionViewCell {
    func setupViews() {
        addView(productImage)
        addView(stackView)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: topAnchor),
            productImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 100),
            productImage.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: productImage.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    func configureAppearance() {
    }
}

extension ProductCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

