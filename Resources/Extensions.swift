//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 13/12/2023.
//

import UIKit

extension UIView{
    func addSubviews(_ views:UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
