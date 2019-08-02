//
//  LettyTemplateViewController.swift
//  Letterin
//
//  Created by Italo Boss on 27/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class LettyTemplateViewController: UIViewController {
    
    var templateView: UIImageView? = nil
    let closeButton = UIButton()
    var backgroundsCollection: UICollectionView?
    let reusableCellIdentifier = "LettyBgCell"
    
    var backgrounds = [
        LettyBg(coverImage: UIImage(named: "bg01")!),
        LettyBg(coverImage: UIImage(named: "bg02")!),
        LettyBg(coverImage: UIImage(named: "bg03")!),
        LettyBg(coverImage: UIImage(named: "bg04")!),
        LettyBg(coverImage: UIImage(named: "bg05")!),
        LettyBg(coverImage: UIImage(named: "bg06")!),
        LettyBg(coverImage: UIImage(named: "bg07")!),
        LettyBg(coverImage: UIImage(named: "bg08")!),
        LettyBg(coverImage: UIImage(named: "bg09")!),
        LettyBg(coverImage: UIImage(named: "bg10")!),
        LettyBg(coverImage: UIImage(named: "bg11")!),
        LettyBg(coverImage: UIImage(named: "bg12")!),
        LettyBg(coverImage: UIImage(named: "bg13")!),
        LettyBg(coverImage: UIImage(named: "bg14")!),
        LettyBg(coverImage: UIImage(named: "bg15")!),
        LettyBg(coverImage: UIImage(named: "bg16")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
    }
    
    func setupLayout() {
        templateView?.contentMode = .scaleAspectFill
        view = templateView
        view.addSubview(closeButton)
        view.backgroundColor = .white
        
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(Colors.primary, for: .normal)
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        closeButton.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.layoutMarginsGuide.leftAnchor,
                            paddingTop: 16)
        
        if let collection = backgroundsCollection {
            view.addSubview(collection)
            collection.anchor(left: view.leftAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, right: view.rightAnchor, height: 125)
            collection.showsHorizontalScrollIndicator = false
        }
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.0
        layout.itemSize = CGSize(width: 66, height: 125)
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(LettyBgCollectionViewCell.self, forCellWithReuseIdentifier: reusableCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        backgroundsCollection = collectionView
    }
    
    @objc func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LettyTemplateViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgrounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as? LettyBgCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let bg = backgrounds[indexPath.row]
        cell.coverView.image = bg.coverImage
        
        return cell
    }
    
}

extension LettyTemplateViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bg = backgrounds[indexPath.row]
        templateView?.image = bg.coverImage
    }
    
}
