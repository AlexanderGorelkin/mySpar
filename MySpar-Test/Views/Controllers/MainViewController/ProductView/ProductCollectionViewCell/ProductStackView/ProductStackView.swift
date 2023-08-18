//
//  ProductStackView.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//

import UIKit


final class ProductStackView: BaseView {
    
    private let priceLabelStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
  
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8, weight: .heavy)
        label.textColor = .black
        label.text = "199.90"
        
        return label
    }()
    
    private let priceImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "plus.forwardslash.minus")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private let productStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private let basketButton: UIButton = {
       let basketButton = UIButton()
        basketButton.layer.cornerRadius = 15
        let imageIcon = UIImage(systemName: "basket")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        basketButton.setImage(imageIcon, for: .normal)
        basketButton.backgroundColor = R.Colors.sparGreen
        return basketButton
    }()
    
    init(priceLabel: String) {
        super.init(frame: .zero)
        self.priceLabel.text = priceLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ProductStackView {
    override func setupViews() {
        super.setupViews()
        addView(priceLabelStackView)
        priceLabelStackView.addArrangedSubview(priceLabel)
        priceLabelStackView.addArrangedSubview(priceImageView)
        addView(productStackView)
        productStackView.addArrangedSubview(priceLabelStackView)
        productStackView.addArrangedSubview(basketButton)
        
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            
            
            
            productStackView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            productStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            productStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            productStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            
            basketButton.heightAnchor.constraint(equalToConstant: 30),
            basketButton.widthAnchor.constraint(equalToConstant: 30)
        
        ])
        
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}
