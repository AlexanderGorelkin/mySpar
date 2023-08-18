//
//  UIView+Extensions.swift
//  MySpar-Test
//
//  Created by Александр Горелкин on 13.08.2023.
//

import UIKit


extension UIView {
    func addButtomBorder(with color: UIColor, height: CGFloat) {
            let separator = UIView()
            separator.backgroundColor = color
            separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            separator.frame = CGRect(x: 0,
                                     y: frame.height - height,
                                     width: frame.width,
                                     height: height)
            addSubview(separator)
        }
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
