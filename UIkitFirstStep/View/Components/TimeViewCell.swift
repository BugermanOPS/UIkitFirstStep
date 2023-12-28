//
//  TimeViewCell.swift
//  UIkitFirstStep
//
//  Created by andrei on 05.12.2023.
//
//TODO: Cоздание ячейки коллекции элемента, в которой принимаются параметры: reuseID, картинка в виде символа SF, цвет фона а также наименование.

import UIKit

class TimeViewCell: UICollectionViewCell {
    static let reuseID = "TimeViewCell"
    
    var timeImageView = UIImageView()
    var bgImage = UIColor()
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    //MARK: функции setViews(), необходимо для настройки параметров переменных.
    func setViews() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
  //      timeImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        timeImageView.tintColor = .black
        timeImageView.contentMode = .scaleAspectFit
        timeImageView.layer.masksToBounds = true
        timeImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        timeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.numberOfLines = 2
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    //MARK: функции setConstraints(), необходим для расстановки Constraints или точек привязок для расставления элемента на экране.
    func setConstraints() {
        let stack = UIStackView(views: [timeImageView, titleLabel], axis: .vertical, spacing: 10, aligment: .fill)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        NSLayoutConstraint.activate([
//            stack.topAnchor.constraint(equalTo:topAnchor, constant: 15),
//            stack.leftAnchor.constraint(equalTo: leftAnchor,constant: 10),
//            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
//            stack.widthAnchor.constraint(equalToConstant: 135),
//            stack.heightAnchor.constraint(equalToConstant: 135)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    TimeViewCell()
}
