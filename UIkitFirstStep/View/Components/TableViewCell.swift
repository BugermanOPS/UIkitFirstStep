//
//  TableViewCell.swift
//  UIkitFirstStep
//
//  Created by andrei on 10.12.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let reuseID = "TableViewCell"
    let imageCircle = UIImageView()
    var textLabelCell = UILabel()
   
    var innerStackView = UIStackView()
    var outerStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        setConstraints()
        setViews()
    }
    
    private func setViews() {
        backgroundColor = UIColor(named: "bgColor")

        imageCircle.backgroundColor = .systemBlue
        imageCircle.layer.cornerRadius = 13
        imageCircle.clipsToBounds = true
        imageCircle.contentMode = .scaleAspectFill
        imageCircle.heightAnchor.constraint(equalToConstant: 26).isActive = true
        imageCircle.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
      //  textLabelCell.text = "new idea"
        textLabelCell.font = .systemFont(ofSize: 20)
        
        innerStackView.backgroundColor = .white
        
        outerStackView.backgroundColor = .white
      
        outerStackView.layer.cornerRadius = 22
        outerStackView.layer.borderColor = UIColor.black.cgColor
        outerStackView.layer.borderWidth = 1
        outerStackView.clipsToBounds = true

    }
    
    func setConstraints() {
        // Bнутренний стек куда входит imageCircle, textLabelCell.
        innerStackView = UIStackView(views: [imageCircle, textLabelCell],
                                axis: .horizontal,
                                spacing: 20,
                                aligment: .center)
     
        // Bнешний стек куда входит внутренний стек.
        outerStackView = UIStackView(views: [innerStackView],
                                axis: .vertical,
                                spacing: 10,
                                aligment: .center)
        
        // Установите ограничения для внешнего стека
        contentView.addSubview(outerStackView)
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            outerStackView.heightAnchor.constraint(equalToConstant: 43),
            outerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), // отступ слева
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor) // отступ справа
        ])
        
        // Установите ограничения для внутреннего стека
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            innerStackView.leadingAnchor.constraint(equalTo: outerStackView.leadingAnchor, constant: 10), // отступ слева
            innerStackView.trailingAnchor.constraint(equalTo: outerStackView.trailingAnchor, constant: -10), // отступ справа
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    TableViewCell()
}


//MARK: Разработка ячейки которая будет входить в таблицу и показывать данные.         Установка параметров таких как setViews() и setConstraints().
