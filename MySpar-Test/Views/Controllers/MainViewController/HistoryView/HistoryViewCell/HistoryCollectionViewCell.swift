//
//  HistoryCollectionViewCell.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 15.08.2023.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class HistoryCollectionViewCell: UICollectionViewCell {
    private let historyImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 30
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = R.Colors.sparGreen.cgColor
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        return label
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
    
    
    func setup(with onboardingModel: HistoryModel) {
        historyImage.image = onboardingModel.image
        title.text = onboardingModel.title
    }
}
extension HistoryCollectionViewCell {
    func setupViews() {
        addView(historyImage)
        addView(title)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
//
            historyImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            historyImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            historyImage.heightAnchor.constraint(equalToConstant: 60),
            historyImage.widthAnchor.constraint(equalToConstant: 60),
            
            title.topAnchor.constraint(equalTo: historyImage.bottomAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            title.heightAnchor.constraint(equalToConstant: 20),
            title.widthAnchor.constraint(equalToConstant: 60),

        ])
        
    }
    func configureAppearance() {
    }
}

extension HistoryCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
