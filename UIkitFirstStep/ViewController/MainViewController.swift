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
    
    var sections = [TargetSection]() 
    {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
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
        self.sections.count
    }
    
    //Возвращает количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sections[section].target.count
    }
    
    //Создаёт, заполняет и возвращает ячейку по каждому indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID) as! TableViewCell
        
        
        let targetBase = self.sections[indexPath.section].target[indexPath.row]
        cell.textLabelCell.text = targetBase.targetTitle
        
        return cell
    }
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: Bвод данных в таблицу в MainViewController, в ячейку секции.
extension MainViewController: AddNewTargetDelegate {
    func getTarget(_ target: Target) -> Bool {
  //      var x = 0
        if self.sections.isEmpty {

            let rowInfo = TargetSection(category: target.category, target: [target])
            self.sections.append(rowInfo)
        }
        else {
            self.sections[sections.startIndex].target.append(target)
        }
        return true
    }
}

#Preview {
    MainViewController()
}
