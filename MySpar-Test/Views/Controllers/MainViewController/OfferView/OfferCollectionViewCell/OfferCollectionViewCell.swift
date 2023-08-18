//
//  OfferCollectionViewCell.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//

import UIKit

final class OfferCollectionViewCell: UICollectionViewCell {
    private let offerImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with promoModel: PromoModel) {
        offerImage.image = promoModel.promoImage
    }
}
extension OfferCollectionViewCell {
    func setupViews() {
        addView(offerImage)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
//
            offerImage.topAnchor.constraint(equalTo: topAnchor),
            offerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            offerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            offerImage.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    func configureAppearance() {
    }
}

extension OfferCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

