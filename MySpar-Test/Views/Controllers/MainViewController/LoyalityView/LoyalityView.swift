//
//  LoyalityView.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//

import UIKit

final class LoyalityView: BaseView {
    
    
    let mainView = UIView()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .fill
        return stackView
    }()
    
    
    private let countOfBonusLabel: UILabel = {
        let label = UILabel()
        
         label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
         return label
    }()
    
    private let bonusesTitle: UILabel = {
       let label = UILabel()
        label.text = "бонусов"
        label.textAlignment = .natural
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return label
    }()
    
    private let qrCodeImage: UIImageView = {
       let image = UIImageView()
        
        image.layer.cornerRadius = 10
        
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    init(with loyalityModel: LoyalityModel) {
        super.init(frame: .zero)
        mainView.layer.cornerRadius = 25
        mainView.backgroundColor = .lightGray
        qrCodeImage.image = loyalityModel.qrCode
        countOfBonusLabel.text = "\(loyalityModel.bonuses)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LoyalityView {
    override func setupViews() {
        super.setupViews()
        addView(mainView)
        mainView.addView(stackView)
        stackView.addArrangedSubview(countOfBonusLabel)
        stackView.addArrangedSubview(bonusesTitle)
        mainView.addView(qrCodeImage)
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        
        
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            
            
            qrCodeImage.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            qrCodeImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            qrCodeImage.heightAnchor.constraint(equalToConstant: 70),
            qrCodeImage.widthAnchor.constraint(equalToConstant: 70),
            
        
        ])
    }
}



