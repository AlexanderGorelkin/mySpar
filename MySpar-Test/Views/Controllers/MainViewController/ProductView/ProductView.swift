//
//  ProductView.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//

import UIKit



final class ProductView: BaseView {
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Product"
        return label
    }()
    fileprivate var array: [ProductModel] = []
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    init(with title: String, and array: [ProductModel]) {
        super.init(frame: .zero)
        self.array = array
        productTitle.text = title

        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ProductView {
    override func setupViews() {
        super.setupViews()
        addView(productTitle)
        addView(collectionView)
        
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            productTitle.topAnchor.constraint(equalTo: topAnchor),
            productTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            productTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            
            
            collectionView.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
}

extension ProductView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
                
        return cell
    }
}
extension ProductView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
}


