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
    var lettyTemplate: LettyTemplate
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.abrilRegular.name, size: 17)
        button.setTitleColor(Colors.primary.value, for: .normal)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.abrilRegular.name, size: 17)
        button.setTitleColor(Colors.primary.value, for: .normal)
        button.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.abrilRegular.name, size: 17)
        button.setTitleColor(Colors.primary.value, for: .normal)
        button.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        return button
    }()
    
    var backgroundsCollection: UICollectionView?
    let reusableCellIdentifier = "LettyBgCell"
    
    var backgrounds = LettyBg.loadAllKinds()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    init(letty: LettyTemplate) {
        lettyTemplate = letty
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadData()
        setupLayout()
        setupGestures()
    }
    
    func loadData() {
        let kindTemplateView = lettyTemplate.kind.classType.init()
        kindTemplateView.image = lettyTemplate.backgroud?.kind.image
        templateView = kindTemplateView
        if let templating = kindTemplateView as? LettyTemplating {
            templating.fill(template: lettyTemplate)
        }
    }
    
    func setupLayout() {
        // Comment used for layout new templates
//        templateView?.contentMode = .scaleAspectFit
        templateView?.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        
        if let template = templateView {
            view.addSubview(template)
            template.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        }
        
        view.addSubview(closeButton)
        view.addSubview(shareButton)
        view.addSubview(saveButton)
        
        closeButton.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.layoutMarginsGuide.leftAnchor, paddingTop: 16)
        saveButton.anchor(top: view.layoutMarginsGuide.topAnchor, right: view.layoutMarginsGuide.rightAnchor, paddingTop: 16)
        shareButton.anchor(top: view.layoutMarginsGuide.topAnchor, right: saveButton.leftAnchor, paddingTop: 16, paddingRight: 16)
        
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
    
    @objc func didTapSave() {
        setupDataToSave()
        
        if lettyTemplate.saveAtGallery() {
            let alert = UIAlertController(title: "Saved!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                alert.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Error on saving", message: "Cannot save your Letty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                alert.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func setupDataToSave() {
        lettyTemplate.backgroud = getSelectedBackground()
        if let template = templateView {
            lettyTemplate.sections = []
            let mirror = Mirror(reflecting: template)
            for child in mirror.children {
                if let section = child.value as? LetteringSectionView {
                    lettyTemplate.sections?.append(
                        LettySection(text: section.text,
                                     color: Colors.caseFromValue(section.textColor),
                                     font: Fonts.caseFromName(section.fontName))
                    )
                }
            }
        }
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
        cell.coverView.image = bg.kind.image
        
        return cell
    }
    
    func getSelectedBackground() -> LettyBg? {
        guard
            let indexPaths = backgroundsCollection?.indexPathsForSelectedItems,
            let selected = indexPaths.first
            else {
                return nil
        }
        return backgrounds[selected.row]
    }
    
}

extension LettyTemplateViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bg = backgrounds[indexPath.row]
        templateView?.image = bg.kind.image
    }
    
}
