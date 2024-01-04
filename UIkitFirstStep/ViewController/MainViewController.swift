//
//  MainViewController.swift
//  UIkitFirstStep
//
//  Created by andrei on 04.12.2023.
//

import UIKit

//MARK: Cоздание протокола, который служит для заполнения таблицы данными.
protocol AddNewTargetDelegate: AnyObject {
    func getTarget(_ target: Target) -> Bool
}

class MainViewController: UIViewController {
    let mainView = MainView()
    var timeView = TimeView.getTimeView()
    
    var sectionData: [TargetSection] = [
        .init(category: .ImportantQuickly, target: [
            .init(targetTitle: "name1", description: "1", category: .ImportantQuickly),
            .init(targetTitle: "mame2", description: "2", category: .ImportantQuickly),
            .init(targetTitle: "mame3", description: "3", category: .ImportantQuickly)
        ]),
        .init(category: .ImportantNotQuickly, target: [
            .init(targetTitle: "name1", description: "1", category: .ImportantNotQuickly),
            .init(targetTitle: "mame2", description: "2", category: .ImportantNotQuickly),
            .init(targetTitle: "mame3", description: "3", category: .ImportantNotQuickly)
        ]),
        .init(category: .NotImportantQuickly, target: [
            .init(targetTitle: "name1", description: "1", category: .NotImportantQuickly),
            .init(targetTitle: "mame2", description: "2", category: .NotImportantQuickly)
        ]),
        .init(category: .NotImportantNotQuickly, target: [
            .init(targetTitle: "name1", description: "1", category: .NotImportantNotQuickly),
            .init(targetTitle: "mame2", description: "2", category: .NotImportantNotQuickly)
        ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        //MARK: delegate необходим для от отслеживания изменений.
        mainView.collectionView.delegate = self
        mainView.tableView.delegate = self
        
        //MARK: dataSource необходимо для подключение.
        mainView.collectionView.dataSource = self
        mainView.tableView.dataSource = self
        
        //MARK: allowsSelection нужно для того чтобы убрать выделение в ячейке таблицы.
        mainView.tableView.allowsSelection = false
        
        goToStartView()
    }
    
    func goToStartView(){
        let goToStartView = UIAction { _ in
            let startController = StartController()
            startController.addNewTargettDelegate = self
            
            self.present(startController, animated: true)
        }
        mainView.addTargetButton.addAction(goToStartView, for: .touchUpInside)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentTime = timeView[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeViewCell.reuseID , for: indexPath) as! TimeViewCell
        
        cell.backgroundColor = currentTime.bgView!
        cell.timeImageView.image = UIImage(systemName: "\(currentTime.imageTitle)")
        cell.titleLabel.text = currentTime.title
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 7 , height: collectionView.frame.height / 2 - 7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}


extension MainViewController: UITableViewDataSource {
    
    //Возвращает количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        print(sectionData.count)
        return self.sectionData.count
    }
    
    //Возвращает количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionData[section].target.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID) as! TableViewCell
        
        let targetCells = self.sectionData[indexPath.section].target[indexPath.row]
        
        cell.textLabelCell.text = targetCells.targetTitle
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionData[section].category.rawValue
    }
}

extension MainViewController: AddNewTargetDelegate {
    func getTarget(_ target: Target) -> Bool {
            sectionData[1].target.append(target)
            mainView.tableView.reloadData()
        return true
    }
}

#Preview {
    MainViewController()
}
