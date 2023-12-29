//
//  ViewController.swift
//  UIkitFirstStep
//
//  Created by andrei on 02.12.2023.
//

import UIKit

class StartController: UIViewController {
    let mainView = StartView()
    var firstSwitch: Bool = false
    var secondSwitch: Bool = false

    
    weak var addNewTargettDelegate: AddNewTargetDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        
        self.mainView.important.addTarget(self, action: #selector(switchFirstValueDidChange(_:)), for: .valueChanged)
        self.mainView.immediate.addTarget(self, action: #selector(switchSecondValueDidChange(_:)), for: .valueChanged)

        saveNewTarget()
    }
    
    @objc func switchFirstValueDidChange(_ sender: UISwitch) {
        firstSwitch = sender.isOn // Обновляем значение переменной при изменении состояния UISwitch
            if firstSwitch {
                print("\(firstSwitch) - Switch включен first")
            } else {
                print("\(firstSwitch) - Switch выключен first")
            }
        }
    
    @objc func switchSecondValueDidChange(_ sender: UISwitch) {
        secondSwitch = sender.isOn // Обновляем значение переменной при изменении состояния UISwitch
            if secondSwitch {
                print("\(secondSwitch) - Switch включен second")
            } else {
                print("\(secondSwitch) - Switch выключен second")
            }
        }
    
    //MARK: Проверка параметров "self.mainView.important" и "self.mainView.immediate" на свойства включено или выключено.
    func switchValueDidChange() {
        switch (firstSwitch, secondSwitch) {
        case (false, false):
            print(TargetCategory.NotImportantNotQuickly.rawValue)
        case (true, true):
            print(TargetCategory.ImportantQuickly.rawValue)
        case (true, false):
            print(TargetCategory.ImportantNotQuickly.rawValue)
        default:
            print(TargetCategory.NotImportantQuickly.rawValue)
        }
    }
    
    func saveNewTarget() {
        //TODO: Проверка ввода данных и обработка их при нажатии кнопки сохранить.
        //        guard let targetTitle = self.mainView.tfName.text,
        //              let description = self.mainView.tfDescription.text
        //              let category = self.mainView.tfCategories.text
        //        else{ return }
        //
        //        let check = (self.mainView.immediate, self.mainView.important)
        //
        //        print(check)
        //TODO: END.
        
        
        //TODO: доделать ввод данных.
        let saveAction = UIAction { _ in
           
            self.switchValueDidChange() // Параметры "важно" и "срочно".

            let newTarget = Target(targetTitle: "1",
                                   description: "2",
                                   category: TargetCategory.ImportantNotQuickly)
            
            guard let added = self.addNewTargettDelegate?.getTarget(newTarget)
            else { return }
            
            if added {
                self.dismiss(animated: true) // ?????
            } else {
                print("Такой продукт уже есть в списке")
            }
        }
        mainView.saveButton.addAction(saveAction, for: .touchUpInside)
    }
}

#Preview {
    StartView()
}
