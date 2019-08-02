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
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(Colors.primary, for: .normal)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return button
    }()
    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.abrilRegular.name, size: 17)
        button.setTitleColor(Colors.primary, for: .normal)
        button.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        return button
    }()
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
        setupGestures()
    }
    
    func setupLayout() {
        // Used for layout templates
        // templateView?.contentMode = .scaleAspectFit
        templateView?.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        
        if let template = templateView {
            view.addSubview(template)
            template.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        }
        
        view.addSubview(closeButton)
        view.addSubview(shareButton)
        
        closeButton.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.layoutMarginsGuide.leftAnchor,
                            paddingTop: 16)
        shareButton.anchor(top: view.layoutMarginsGuide.topAnchor, right: view.layoutMarginsGuide.rightAnchor,
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
    
    func setupGestures() {
        if let template = templateView {
            let mirror = Mirror(reflecting: template)
            
            for child in mirror.children {
                if let section = child.value as? LetteringSectionView {
                    section.addGestureRecognizer(
                        UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
                    )
                }
            }
            
        }
    }
    
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        if let tapped = gestureRecognizer.view as? LetteringSectionView {
            let editSection = EditSectionViewController(section: tapped)
            self.present(editSection, animated: true)
        }
    }
    
    @objc func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapShare() {
        if let image = templateView?.asImage() {
            let shareActivity = UIActivityViewController(activityItems: [image], applicationActivities: [])
            present(shareActivity, animated: true)
        }
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
