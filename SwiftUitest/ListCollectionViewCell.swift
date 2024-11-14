//
//  ListCollectionViewCell.swift
//  SwiftUitest
//
//  Created by user@59 on 20/08/1946 Saka.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var CardView: UIView!
    
    @IBOutlet weak var CafeImageview: UIImageView!
    
    
    @IBOutlet weak var CafeNameLabel: UILabel!
    
    @IBOutlet weak var CafeAddLabel: UILabel!
    
    
    @IBOutlet weak var CafeTypeLabel: UILabel!
    
    func setUp(with cafe: Cafe) {
        CafeImageview.image = cafe.CafeImage
        CafeNameLabel.text = cafe.CafeName
        CafeAddLabel.text = cafe.CafeAddress
        CafeTypeLabel.text = cafe.CafeType
        
        CardView.layer.cornerRadius = 20
        CardView.layer.masksToBounds = false
        CardView.layer.shadowColor = UIColor.white.cgColor
        CardView.layer.shadowOpacity = 0.2
        CardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        CardView.layer.shadowRadius = 4
        
        CafeImageview.layer.cornerRadius = 20
        CafeImageview.layer.masksToBounds = true
    }
    
    
}


    

