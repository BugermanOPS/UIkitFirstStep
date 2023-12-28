//
//  MainView.swift
//  UIkitFirstStep
//
//  Created by andrei on 04.12.2023.
//

import UIKit

class MainView: UIView {
    let settingsButton = UIButton.init(sfSymbol: "slider.horizontal.3")
    let labelName = UILabel()
    let addTargetButton = UIButton.init(sfSymbol: "plus")
    
    var collectionView: UICollectionView!
    let screenSize = UIScreen.main.bounds
    
    var tableView = UITableView(frame: .zero, style: .plain)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "bgColor")
        
        setViews()
        
        setConstraint()
    }
    
    //MARK: настройка параметров вида элементов.
    private func setViews(){
        //MARK: настройка верхнего меню с названием.
        labelConfig()
        
        //MARK: настройка и создание таблицы.
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "bgColor")
        tableView.rowHeight = 45
        tableView.sectionHeaderHeight = 0
        
        
    }
    
    private func labelConfig() {
        labelName.text = "Kovi App"
        labelName.textAlignment = .center
        labelName.textColor = .white
        labelName.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    //MARK: настройка Constraint элементов.
    private func setConstraint(){
        labelConfig()
        setupMenu()
        setupCollectionView()
        setupTableView()
    }
    
    private func setupMenu(){
        let stackMenu = UIStackView(views: [settingsButton, labelName, addTargetButton],
                                    axis: .horizontal,
                                    spacing: 0,
                                    aligment: .fill)
        addSubview(stackMenu)
        stackMenu.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackMenu.topAnchor.constraint(equalTo:topAnchor, constant: 65),
            stackMenu.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            stackMenu.rightAnchor.constraint(equalTo: rightAnchor, constant: -30)
        ])
    }
    
    private func setupCollectionView() {
        let sideOut = 30
        let layOut = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
       
        collectionView.register(TimeViewCell.self, forCellWithReuseIdentifier: TimeViewCell.reuseID)
        
        collectionView.backgroundColor = UIColor(named: "bgColor")
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo:topAnchor, constant: 135),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat(sideOut)),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -CGFloat(sideOut)),
            collectionView.heightAnchor.constraint(equalToConstant: screenSize.width - CGFloat((2 * sideOut)))
            ])
    }
    
    private func setupTableView() {
        let sideOut = 30
     
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:collectionView.bottomAnchor, constant: CGFloat(sideOut)/2 ),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat(sideOut)),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -CGFloat(sideOut)),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat(sideOut))
        ])
    }
    
    // ----------- required init ----------
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // ----------- required init ----------
    
}

#Preview {
    MainViewController()
}
