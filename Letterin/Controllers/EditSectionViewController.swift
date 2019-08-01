//
//  EditSectionViewController.swift
//  Letterin
//
//  Created by Italo Boss on 31/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class EditSectionViewController: UIViewController {

    var section: LetteringSectionView? = nil
    
    let editTextView = UITextField()
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.abrilRegular, size: 17)
        button.setTitleColor(Colors.primary, for: .normal)
        button.addTarget(self, action: #selector(didTapDone), for: .touchUpInside)
        return button
    }()
    let accessory: UIView = {
        let accessoryView = UIView(frame: .zero)
        accessoryView.backgroundColor = .clear
        return accessoryView
    }()
    
    var colorPickerCollection: UICollectionView?
    var fontPickerCollection: UICollectionView?
    
    let reusableCellIdentifier = "LettyColorCell"
    
    init(section: LetteringSectionView?) {
        super.init(nibName: nil, bundle: Bundle.main)
        self.section = section
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(doneButton)
        view.addSubview(editTextView)
        self.view.backgroundColor = Colors.greyWhite
        
        doneButton.anchor(top: view.layoutMarginsGuide.topAnchor, right: view.layoutMarginsGuide.rightAnchor,
                           paddingTop: 16)
        
        editTextView.placeholder = "Type something"
        editTextView.textAlignment = .center
        editTextView.font = UIFont.systemFont(ofSize: 24)
        editTextView.textColor = Colors.all.first
        editTextView.becomeFirstResponder()
        editTextView.anchor(left: view.layoutMarginsGuide.leftAnchor, right: view.layoutMarginsGuide.rightAnchor, centerY: view.centerYAnchor, paddingLeft: 16, paddingBottom: 140, paddingRight: 16)
        
        var selectedColorIndex = 0
        if let section = section {
            editTextView.text = section.text
            if let textColor = section.textColor {
                editTextView.textColor = textColor
                selectedColorIndex = Colors.all.firstIndex(of: textColor) ?? 0
            }
        }
        
        accessory.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        accessory.translatesAutoresizingMaskIntoConstraints = false
        
        if let collection = colorPickerCollection {
            accessory.addSubview(collection)
            collection.anchor(top: accessory.topAnchor, left: accessory.leftAnchor, right: accessory.rightAnchor, height: 40)
            collection.showsHorizontalScrollIndicator = false
            collection.selectItem(at: IndexPath(row: selectedColorIndex, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.left)
            editTextView.inputAccessoryView = accessory
        }
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 4.0
        layout.itemSize = CGSize(width: 32, height: 40)
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(ColorPickerCollectionViewCell.self, forCellWithReuseIdentifier: reusableCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        colorPickerCollection = collectionView
    }
    
    @objc func didTapDone() {
        editTextView.resignFirstResponder()
        if let section = section {
            section.text = editTextView.text
            section.textColor = editTextView.textColor ?? .black
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension EditSectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Colors.all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as? ColorPickerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let color = Colors.all[indexPath.row]
        cell.color = color
        
        return cell
    }
    
}

extension EditSectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = Colors.all[indexPath.row]
        editTextView.textColor = color
    }
    
}
