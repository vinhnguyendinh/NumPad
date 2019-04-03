//
//  NumberPadCell.swift
//  PhonePadCollectionView
//
//  Created by Nguyen Vinh on 4/3/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

class NumberPadCell: UICollectionViewCell {
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var contentContainerView: UIView!
    
    override var isHighlighted: Bool {
        didSet {
            contentContainerView.backgroundColor = isHighlighted ? #colorLiteral(red: 0.7884325091, green: 0.7962387715, blue: 0.7962387715, alpha: 1) : #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentContainerView.backgroundColor = #colorLiteral(red: 0.8939154744, green: 0.8981112838, blue: 0.8979777694, alpha: 1)
        
        if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
            phoneLabel.font = UIFont.systemFont(ofSize: 24)
            letterLabel.font = UIFont.boldSystemFont(ofSize: 8)
        } else {
            phoneLabel.font = UIFont.systemFont(ofSize: 32)
            letterLabel.font = UIFont.boldSystemFont(ofSize: 10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentContainerView.layer.cornerRadius = self.frame.width / 2
        contentContainerView.layer.masksToBounds = true
    }

}
