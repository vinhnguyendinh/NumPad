//
//  PhoneHeaderView.swift
//  PhonePadCollectionView
//
//  Created by Nguyen Vinh on 4/3/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

class PhoneHeaderView: UICollectionReusableView {
    // MARK: - UI Property
    @IBOutlet weak var phoneLabel: UILabel!

    // MARK: - Property
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLabel()
    }
    
    // MARK: - Config
    fileprivate func setupLabel() {
        phoneLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - UI Action
    
    // MARK: - Handler
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils
}
