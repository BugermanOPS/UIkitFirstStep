//
//  StartView.swift
//  UIkitFirstStep
//
//  Created by andrei on 02.12.2023.
//

import UIKit

class StartView: UIView {
    let titleLabel = UILabel()
    
    let tfName = UITextField(placeholder: "Название")
    let tfDescription = UITextField(placeholder: "Oписание")
    let tfCategories = UITextField(placeholder: "Kатегория")
    
    let important = UISwitch(color: UIColor.black.cgColor)  // важная
    let immediate = UISwitch(color: UIColor.black.cgColor) // срочная
    
    let titleImportant = UILabel()// важная
    let titleImmediate = UILabel() // срочная
    
    let saveButton = UIButton()
    
    //----------------------------------------------->
    init() {
        super.init(frame: .zero)
        setViews()
        setConstraint()
    }
    
    private func setViews(){
        
        //MARK: Настройка цвета фона на экране цветом "bgColor"
        backgroundColor = UIColor(named: "bgColor")
        
        //MARK: Настройка UILabel. "Новая задача"
        titleLabel.text = "Новая задача"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        //MARK: Настройка UITextField. "Название", "Oписание", "Kатегория".
        // Настройка при инициализаций, по умолчанию.
        
        //MARK: Настройка UISwitch. "важная", "срочная".
        titleImportant.text = "Bажная?"
        titleImmediate.text = "Cрочная?"
        
        //MARK: Настройка UIButton.
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = UIColor(named: "ButtonColor")
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 23
        
        //MARK: Создание границ. Окрас черным цветом - UIButton.
        saveButton.layer.borderColor = UIColor.gray.cgColor
        saveButton.layer.borderWidth = 1
        
        //MARK: Создание тени. Окрас белый цвет - UIButton.
        saveButton.layer.shadowColor = UIColor.white.cgColor
        saveButton.layer.shadowRadius = 2
        saveButton.layer.shadowOpacity = 0.4
        saveButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        //MARK: Добавление Constraint по высоте - UIButton.
        saveButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    private func setConstraint(){
        //MARK: Добавление Constraint - UITextField. "Название", "Oписание", "Kатегория".
        let stackTfield = UIStackView(views: [tfName, tfDescription, tfCategories],
                                      axis: .vertical,
                                      spacing: 13,
                                      aligment: .fill)
        
        //MARK: Добавление Constraint - stackSwitchOne . titleImportant, important.
        let stackSwitchOne = UIStackView(views: [titleImportant, important],
                                         axis: .horizontal,
                                         spacing: 50,
                                         aligment: .fill)
        
        //MARK: Добавление Constraint - stackSwitchTwo . titleImmediate, immediate.
        let stackSwitchTwo = UIStackView(views: [titleImmediate, immediate],
                                         axis: .horizontal,
                                         spacing: 50,
                                         aligment: .fill)
        
        //MARK: Добавление в стэк Constraint - stackSwitchOne, stackSwitchTwo.
        let stackSwitchOnePlusTwo = UIStackView(views: [stackSwitchOne, stackSwitchTwo],
                                                axis: .vertical,
                                                spacing: 10,
                                                aligment: .fill)
        
        //MARK: Создание одного стэка и помещяем все элементы в один. Constraint - titleLabel, stackTfield, stackSwitchOnePlusTwo, saveButton.
        let oneMainStack = UIStackView(views: [titleLabel, stackTfield, stackSwitchOnePlusTwo, saveButton],
                                       axis: .vertical,
                                       spacing: 55,
                                       aligment: .fill)
        addSubview(oneMainStack)
        oneMainStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([oneMainStack.topAnchor.constraint(equalTo:
                                                                            topAnchor, constant: 70),
                                      oneMainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                                      oneMainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    //MARK: ERROR by swift...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    StartView()
}
