//
//  EditSectionViewController.swift
//  Letterin
//
//  Created by Italo Boss on 31/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class EditSectionViewController: UIViewController {

    // MARK: - Components
    var section: LetteringSectionView? = nil
    
    let editTextView = UITextField()
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.abrilRegular.name, size: 17)
        button.setTitleColor(Colors.primary.value, for: .normal)
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
    
    // MARK: -  Properties
    let colorCellIdentifier = "LettyColorCell"
    let fontCellIdentifier = "LettyFontCell"
    
    private var allColors: [UIColor] {
        return Colors.allCases.map { $0.value }
    }
    private var allFontsToCell: [UIFont?] {
        return Fonts.allCases.map { $0.fontToCell }
    }
    private var allFontsName: [String] {
        return Fonts.allCases.map { $0.name }
    }
    private let fontSize: CGFloat = 24.0
    private var selectedFontName = Fonts.abrilRegular.name
    
    // MARK: - Initializers
    init(section: LetteringSectionView?) {
        super.init(nibName: nil, bundle: Bundle.main)
        self.section = section
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View setup functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(doneButton)
        view.addSubview(editTextView)
        self.view.backgroundColor = Colors.greyWhite.value
        
        doneButton.anchor(top: view.layoutMarginsGuide.topAnchor, right: view.layoutMarginsGuide.rightAnchor,
                           paddingTop: 16)
        
        editTextView.placeholder = "Type something"
        editTextView.textAlignment = .center
        editTextView.font = UIFont(name: allFontsName.first ?? ".SFUIDisplay", size: fontSize)
        editTextView.textColor = allColors.first
        editTextView.becomeFirstResponder()
        editTextView.anchor(left: view.layoutMarginsGuide.leftAnchor, right: view.layoutMarginsGuide.rightAnchor, centerY: view.centerYAnchor, paddingLeft: 16, paddingBottom: 140, paddingRight: 16)
        
        var selectedColorIndex = 0
        var selectedFontIndex = 0
        if let section = section {
            editTextView.text = section.text
            if let textColor = section.textColor {
                editTextView.textColor = textColor
                selectedColorIndex = allColors.firstIndex(of: textColor) ?? 0
            }
            if let fontName = section.fontName {
                selectedFontName = fontName
                editTextView.font = UIFont(name: fontName, size: fontSize)
                selectedFontIndex = allFontsName.firstIndex(of: fontName) ?? 0
            }
        }
        
        accessory.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 90)
        accessory.translatesAutoresizingMaskIntoConstraints = false
        
        if let colorCollection = colorPickerCollection, let fontCollection = fontPickerCollection {
            accessory.addSubview(colorCollection)
            accessory.addSubview(fontCollection)
            
            colorCollection.anchor(top: accessory.topAnchor, left: accessory.leftAnchor, right: accessory.rightAnchor, height: 50)
            colorCollection.showsHorizontalScrollIndicator = false
            colorCollection.selectItem(at: IndexPath(row: selectedColorIndex, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
            
            fontCollection.anchor(left: accessory.leftAnchor, bottom: accessory.bottomAnchor, right: accessory.rightAnchor, height: 40)
            fontCollection.showsHorizontalScrollIndicator = false
            if !allFontsName.isEmpty {
                fontCollection.selectItem(at: IndexPath(row: selectedFontIndex, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
            }
            
            editTextView.inputAccessoryView = accessory
        }
    }
    
    func setupCollectionView() {
        let colorCollectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        colorCollectionLayout.scrollDirection = .horizontal
        colorCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        colorCollectionLayout.minimumLineSpacing = 4.0
        colorCollectionLayout.itemSize = CGSize(width: 32, height: 50)
        
        let colorsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: colorCollectionLayout)
        colorsCollectionView.register(ColorPickerCollectionViewCell.self, forCellWithReuseIdentifier: colorCellIdentifier)
        colorsCollectionView.dataSource = self
        colorsCollectionView.delegate = self
        colorsCollectionView.backgroundColor = .clear
        
        
        let fontCollectionlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        fontCollectionlayout.scrollDirection = .horizontal
        fontCollectionlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        fontCollectionlayout.minimumLineSpacing = 0.0
        fontCollectionlayout.itemSize = CGSize(width: 42, height: 40)
        
        let fontsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: fontCollectionlayout)
        fontsCollectionView.register(FontPickerCollectionViewCell.self, forCellWithReuseIdentifier: fontCellIdentifier)
        fontsCollectionView.dataSource = self
        fontsCollectionView.delegate = self
        fontsCollectionView.backgroundColor = .white
        
        colorPickerCollection = colorsCollectionView
        fontPickerCollection = fontsCollectionView
    }
    
    // MARK: - Actions
    @objc func didTapDone() {
        editTextView.resignFirstResponder()
        if let section = section {
            section.text = editTextView.text
            section.textColor = editTextView.textColor ?? .black
            section.fontName = selectedFontName
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - CollectionView - Data Source
extension EditSectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == colorPickerCollection ? allColors.count : allFontsName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == colorPickerCollection, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCellIdentifier, for: indexPath) as? ColorPickerCollectionViewCell {
            let color = allColors[indexPath.row]
            cell.color = color
            return cell
        }
        else if collectionView == fontPickerCollection, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fontCellIdentifier, for: indexPath) as? FontPickerCollectionViewCell {
            if let font = allFontsToCell[indexPath.row] {
                cell.font = font
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

// MARK: - CollectionView - Delegate
extension EditSectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == colorPickerCollection {
            let color = allColors[indexPath.row]
            editTextView.textColor = color
        }
        else if collectionView == fontPickerCollection {
            let fontName = allFontsName[indexPath.row]
            selectedFontName = fontName
            editTextView.font = UIFont(name: fontName, size: fontSize)
        }
    }
    
}
