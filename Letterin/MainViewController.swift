//
//  ViewController.swift
//  Letterin
//
//  Created by Italo Boss on 25/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let titleLabel = UILabel()
    var templatesCollection: UICollectionView?
    let reusableCellIdentifier = "LettyTemplateCell"
    
    let templates = [
        LettyTemplate(coverImage: UIImage(named: "model5")!, controller: SimpleOneTemplateController()),
        LettyTemplate(coverImage: UIImage(named: "model5")!, controller: SimpleOneTemplateController()),
        LettyTemplate(coverImage: UIImage(named: "model5")!, controller: SimpleOneTemplateController())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("On MainViewController")
        
        setupCollectionView()
        setupLayout()
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 124, height: 220)
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(LettyTemplateCollectionViewCell.self, forCellWithReuseIdentifier: reusableCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        templatesCollection = collectionView
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Letty"
        titleLabel.font = UIFont(name: Fonts.abrilRegular.name, size: 48)
        titleLabel.textColor = Colors.primary
        titleLabel.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.layoutMarginsGuide.leftAnchor,
                          paddingTop: 32)
        
        if let collection = templatesCollection {
            view.addSubview(collection)
            collection.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 64)
            collection.showsVerticalScrollIndicator = false
        }
    }
    
}

// MARK: -> Collection DataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return templates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as? LettyTemplateCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let template = templates[indexPath.row]
        cell.coverView.image = template.coverImage
        
        return cell
    }
    
}

// MARK: -> Collection Delegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let template = templates[indexPath.row]
        let destination = template.controller
        present(destination, animated: true, completion: nil)
    }
    
}
