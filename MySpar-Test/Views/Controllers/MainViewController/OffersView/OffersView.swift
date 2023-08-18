//
//  OffersView.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 17.08.2023.
//


import UIKit



final class OffersView: BaseView {
    
    
    fileprivate var array: [HistoryModel] = []
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        
        viewLayout.minimumInteritemSpacing = 40
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    
    init(frame: CGRect, array: [HistoryModel]) {
        super.init(frame: frame)
        self.array = array
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OffersCollectionViewCell.self, forCellWithReuseIdentifier: OffersCollectionViewCell.identifier)
        addView(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OffersView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.identifier, for: indexPath) as! OffersCollectionViewCell
        cell.setup(with: array[indexPath.row])
        return cell
    }
}
extension OffersView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 90)
    }
}


