//
//  PromoCollectionViewCell.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//

import UIKit

final class PromoCollectionViewCell: UICollectionViewCell {
    private let promoImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        layer.shadowOffset = CGSizeMake(0, 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.cornerRadius = 20
        layer.masksToBounds = true
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with promoModel: PromoModel) {
        promoImage.image = promoModel.promoImage
    }
}
extension PromoCollectionViewCell {
    func setupViews() {
        addView(promoImage)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
//
            promoImage.topAnchor.constraint(equalTo: topAnchor),
            promoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            promoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            promoImage.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    func configureAppearance() {
    }
}

extension PromoCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

