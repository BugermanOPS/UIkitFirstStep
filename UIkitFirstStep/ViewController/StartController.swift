//
//  ViewController.swift
//  UIkitFirstStep
//
//  Created by andrei on 02.12.2023.
//

import UIKit

class StartController: UIViewController {
    let mainView = StartView()
    weak var addNewTargettDelegate: AddNewTargetDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        saveNewTarget()
    }
    
    func saveNewTarget() {
        //TODO: Проверка ввода данных и обработка их при нажатии кнопки сохранить.
        
//        guard let targetTitle = self.mainView.tfName.text,
//              let description = self.mainView.tfDescription.text
//        else{ return }
            
//        let check = (self.mainView.immediate, self.mainView.important)
//        
//        print(check)
//        
        
        //TODO: END.
        let saveAction = UIAction { _ in
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
//    let quit = UIAction { _ in
//        let _: Void = self.dismiss(animated: true)
//        print("работает.")
//        
//        
//    }
//    mainView.saveButton.addAction(quit, for: .touchUpInside)
}

#Preview {
    StartView()
}
