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
        
        mainView.tfCategories.text = self.switchValueDidChange().rawValue
      
        saveNewTarget()
    }
    
    @objc func switchFirstValueDidChange(_ sender: UISwitch) {
        firstSwitch = sender.isOn // Обновляем значение переменной при изменении состояния UISwitch
        if firstSwitch {
            print("\(firstSwitch) - Switch включен first")
        } else {
            print("\(firstSwitch) - Switch выключен first")
        }
        mainView.tfCategories.text = self.switchValueDidChange().rawValue
    }
    
    @objc func switchSecondValueDidChange(_ sender: UISwitch) {
        secondSwitch = sender.isOn // Обновляем значение переменной при изменении состояния UISwitch
        if secondSwitch {
            print("\(secondSwitch) - Switch включен second")
        } else {
            print("\(secondSwitch) - Switch выключен second")
        }
        mainView.tfCategories.text = self.switchValueDidChange().rawValue
    }
    
    //MARK: Проверка параметров "self.mainView.important" и "self.mainView.immediate" на свойства включено или выключено.
    func switchValueDidChange() -> TargetCategory {
        switch (firstSwitch, secondSwitch) {
        case (false, false):
            return TargetCategory.NotImportantNotQuickly
        case (true, true):
            return TargetCategory.ImportantQuickly
        case (true, false):
            return TargetCategory.ImportantNotQuickly
        default:
            return TargetCategory.NotImportantQuickly
        }
    }
    
    func saveNewTarget() {
        let saveAction = UIAction { _ in
            
            //MARK: Проверка ввода данных и обработка их при нажатии кнопки сохранить.
            guard let targetTitle = self.mainView.tfName.text,
                  let description = self.mainView.tfDescription.text
            else { return }
            //MARK: END.
            
            // Параметры "важно" и "срочно", Begin cod.
            let categoryRawValue = self.switchValueDidChange()
            // Параметры "важно" и "срочно". End cod.
            
            let newTarget = Target(targetTitle: targetTitle,
                                   description: description,
                                   category: categoryRawValue)
            
            guard let added = self.addNewTargettDelegate?.getTarget(newTarget)
            else { return }
            
            //TODO: разобрать код ниже.
            if added {
                self.dismiss(animated: true)// ?????
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
