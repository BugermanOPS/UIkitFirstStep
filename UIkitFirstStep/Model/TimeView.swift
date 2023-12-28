//
//  TimeView.swift
//  UIkitFirstStep
//
//  Created by andrei on 04.12.2023.
//

//TODO: Создание модели, где объявлены переменные которые будут использоваться в collectionView...
//Переменные входящие: ID элемента, цвет фона, картинка с использованием SF символа и названия.
import Foundation
import UIKit

struct TimeView: Identifiable {
    let id: String = UUID().uuidString
    let bgView: UIColor?
    let imageTitle: String
    let title: String
    
    static func getTimeView() -> [TimeView] {
        let timeView: [TimeView] = [.init(bgView: UIColor(named: "firstColor"),
                                          imageTitle: "hare", title: "Важное, срочное"),
                                    .init(bgView: UIColor(named: "secondColor"),
                                          imageTitle: "tortoise", title: "Важное, не срочное"),
                                    .init(bgView: UIColor(named: "thirdColor"), imageTitle: "timer", title: "Не важное, срочное"),
                                    .init(bgView: UIColor(named: "fourthColor"), imageTitle: "shippingbox", title: "Не важное, не срочное")]
        return timeView
    }
}



