//
//  ViewController.swift
//  PhonePadCollectionView
//
//  Created by Nguyen Vinh on 4/3/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

enum NumPadSection: Int {
    case num = 0
    case button
}

class ViewController: UIViewController {
    // MARK: - UI Property
    @IBOutlet weak var collectionView: UICollectionView!
    
    var headerView: PhoneHeaderView!
    
    // MARK: - Property
    var pads: [Pad] = []
    
    lazy var leftRightMargin = self.view.frame.width * 0.13
    lazy var widthBetweenPadCell = self.view.frame.width * 0.1
    lazy var topBottomMargin = self.view.frame.width * 0.05
    lazy var heightHeader = self.view.frame.height * 0.2
    lazy var widthPad = (self.view.frame.width - leftRightMargin * 2 - widthBetweenPadCell * 2) / 3

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    // MARK: - Config
    fileprivate func initViews() {
        setupData()
        setupCollectionView()
    }
    
    fileprivate func setupData() {
        self.pads = [
            Pad(number: "1", letter: ""),
            Pad(number: "2", letter: "A B C"),
            Pad(number: "3", letter: "D E F"),
            Pad(number: "4", letter: "G H I"),
            Pad(number: "5", letter: "J K L"),
            Pad(number: "6", letter: "M N O"),
            Pad(number: "7", letter: "P Q R S"),
            Pad(number: "8", letter: "T U V"),
            Pad(number: "9", letter: "W X Y Z"),
            Pad(number: "*", letter: ""),
            Pad(number: "0", letter: "+"),
            Pad(number: "#", letter: ""),
        ]
    }
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: NumberPadCell.self), bundle: nil),
                                forCellWithReuseIdentifier: String(describing: NumberPadCell.self))
        collectionView.register(UINib(nibName: String(describing: PhoneHeaderView.self), bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: String(describing: PhoneHeaderView.self))
        collectionView.register(UINib(nibName: String(describing: GreenCallButtonCell.self), bundle: nil),
                                forCellWithReuseIdentifier: String(describing: GreenCallButtonCell.self))
        collectionView.register(UINib(nibName: String(describing: SpaceCell.self), bundle: nil),
                                forCellWithReuseIdentifier: String(describing: SpaceCell.self))
    }
    
    // MARK: - UI Action
    
    // MARK: - Handler
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return NumPadSection.button.rawValue + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = NumPadSection(rawValue: section) else { return 0 }
        
        switch section {
        case .num:
            return pads.count
            
        case .button:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = NumPadSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch section {
        case .num:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NumberPadCell.self), for: indexPath) as! NumberPadCell
            cell.phoneLabel.text = self.pads[indexPath.item].number
            cell.letterLabel.text = self.pads[indexPath.item].letter
            return cell
            
        case .button:
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GreenCallButtonCell.self), for: indexPath) as! GreenCallButtonCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SpaceCell.self), for: indexPath) as! SpaceCell
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: PhoneHeaderView.self), for: indexPath) as? PhoneHeaderView
        return headerView
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = NumPadSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .num:
            headerView.phoneLabel.text = (headerView.phoneLabel.text ?? "") + pads[indexPath.item].number

        case .button:
            if indexPath.item == 1 {
                headerView.phoneLabel.text = String(headerView.phoneLabel.text?.dropLast() ?? "")
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthPad, height: widthPad)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return topBottomMargin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return widthBetweenPadCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let section = NumPadSection(rawValue: section) else { return .zero }
        
        switch section {
        case .num:
            return .init(top: 0, left: leftRightMargin, bottom: 0, right: leftRightMargin)

        case .button:
            let leftMargin = leftRightMargin + widthPad + widthBetweenPadCell
            return .init(top: topBottomMargin, left: leftMargin, bottom: 0, right: leftRightMargin)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let section = NumPadSection(rawValue: section) else { return .zero }
        
        switch section {
        case .num:
            return CGSize(width: self.view.frame.width, height: heightHeader)
            
        case .button:
            return .zero
        }
    }
}
