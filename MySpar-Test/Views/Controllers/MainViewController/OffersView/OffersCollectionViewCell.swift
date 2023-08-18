//
//  OffersCollectionViewCell.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//


import UIKit


final class OffersCollectionViewCell: UICollectionViewCell {
    private let historyImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 25
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = R.Colors.sparGreen.cgColor
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with onboardingModel: HistoryModel) {
        historyImage.image = onboardingModel.image
    }
}
extension OffersCollectionViewCell {
    func setupViews() {
        addView(historyImage)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
//
            historyImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            historyImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            historyImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            historyImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

        ])
        
    }
    func configureAppearance() {
    }
}

extension OffersCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}


