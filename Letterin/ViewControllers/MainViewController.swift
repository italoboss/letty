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
    
    lazy var tabs: TabsSegmentedControl = {
        let tabsSC = TabsSegmentedControl(frame: .zero)
        tabsSC.insertSegment(withTitle: "Templates", at: 0, animated: true)
        tabsSC.insertSegment(withTitle: "Gallery", at: 1, animated: true)
        tabsSC.selectedSegmentIndex = 0
        tabsSC.translatesAutoresizingMaskIntoConstraints = false
        return tabsSC
    }()
    
    let templates = [
        LettyTemplate(coverImage: UIImage(named: "model6"), kind: .basicOne),
        LettyTemplate(coverImage: UIImage(named: "model5"), kind: .simpleOne),
        LettyTemplate(coverImage: UIImage(named: "model2"), kind: .centerCurvedOne),
        LettyTemplate(coverImage: UIImage(named: "model1"), kind: .centerCurvedTwo),
        LettyTemplate(coverImage: UIImage(named: "model3"), kind: .circleOne)
    ]
    
    let gallery: [LettyTemplate] = [
        LettyTemplate(coverImage: UIImage(named: "model6"), kind: .basicOne)
    ]
    
    var selectedTab = 0 {
        didSet {
            templatesCollection?.reloadData()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
        self.setNeedsStatusBarAppearanceUpdate()
        
        tabs.addTarget(self, action: #selector(didSelectedTab), for: .valueChanged)
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
        view.addSubview(tabs)
        
        titleLabel.text = "Letty"
        titleLabel.font = UIFont(name: Fonts.abrilRegular.name, size: 48)
        titleLabel.textColor = Colors.primary.value
        titleLabel.anchor(
            top: view.layoutMarginsGuide.topAnchor,
            left: view.layoutMarginsGuide.leftAnchor,
            paddingTop: 32,
            paddingLeft: 8
        )
        
        tabs.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 16, height: 24)
        
        if let collection = templatesCollection {
            view.addSubview(collection)
            collection.anchor(top: tabs.bottomAnchor, left: view.leftAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 64)
            collection.showsVerticalScrollIndicator = false
        }
    }
    
    @objc func didSelectedTab(_ sender: UISegmentedControl) {
        selectedTab = sender.selectedSegmentIndex
    }
    
}

// MARK: -> Collection DataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedTab == 0 ? templates.count : gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as? LettyTemplateCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let template = selectedTab == 0 ? templates[indexPath.row] : gallery[indexPath.row]
        cell.coverView.image = template.coverImage
        
        return cell
    }
    
}

// MARK: -> Collection Delegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = selectedTab == 0 ? templates[indexPath.row] : gallery[indexPath.row]
        let destination = LettyTemplateViewController()
        destination.templateView = model.kind.classType.init()
        destination.modalPresentationStyle = .fullScreen
        // Comment used for layout new templates
//        destination.templateView?.image = model.coverImage
        present(destination, animated: true, completion: nil)
    }
    
}


// MARK: - Custom segmented control

class TabsSegmentedControl: UISegmentedControl {
    
    lazy var buttonBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.primary.value
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        setupConstraints()
    }
    
    func setup() {
        setTitleTextAttributes([
            NSAttributedString.Key.font: Fonts.abrilRegular.withSize(17),
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ], for: .normal)
        
        setTitleTextAttributes([
            NSAttributedString.Key.font: Fonts.abrilRegular.withSize(17),
            NSAttributedString.Key.foregroundColor: Colors.primary.value
        ], for: .selected)
        
        backgroundColor = .clear
        let empty = UIImage(ciImage: CIImage.empty())
        setBackgroundImage(empty, for: .normal, barMetrics: .default)
        setDividerImage(empty, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
//        if #available(iOS 13.0, *) {
//            selectedSegmentTintColor = Colors.primary.value
//        } else {
//            tintColor = Colors.primary.value
//        }
        
        addSubview(buttonBar)
    }
    
    func setupConstraints() {
        let width: CGFloat = frame.width / CGFloat(numberOfSegments)
        buttonBar.anchor(left: leftAnchor, bottom: bottomAnchor, width: width, height: 5)
    }
    
    override func didChange(_ changeKind: NSKeyValueChange, valuesAt indexes: IndexSet, forKey key: String) {
        super.didChange(changeKind, valuesAt: indexes, forKey: key)
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        }
    }
    
}
