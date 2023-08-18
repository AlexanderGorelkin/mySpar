//
//  MainNavBar.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 13.08.2023.
//
import UIKit

final class MainNavBar: BaseView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    private let locationButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Москва, Москва и Московская область", for: .normal)
        btn.setImage(UIImage(named: "pin"), for: .normal)
    

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderColor = R.Colors.sparGray.cgColor
        btn.contentHorizontalAlignment = .left
        btn.layer.borderWidth = 0.5
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
        btn.layer.cornerRadius = 14
        btn.layer.masksToBounds = true
        return btn
    }()
    
    private let optionButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        btn.tintColor = R.Colors.sparGreen
        btn.imageView?.contentMode = .scaleToFill
        return btn
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addButtomBorder(with: R.Colors.sparGray, height: 0.5)
    }
    
   
    
    
}
extension MainNavBar {
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        stackView.addArrangedSubview(locationButton)
        stackView.addArrangedSubview(optionButton)
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            
            
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            
            
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}
