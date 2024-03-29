//
//  ViewController.swift
//  Right on target
//
//  Created by Alexandre Samson on 10.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    //загаданное число
    var number: Int = 0
    //раунд
    var round: Int = 1
    // сумма очков за раунд
    var points: Int = 0
    
    @IBAction func checkNumber() {
            
            //получаем значение на слайдере
            let numSlider = Int(self.slider.value)
            //сравниваем значение с загаданным
            //и подсчитываем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                //выводим информационное окно
                //с результатом игры
                let alert = UIAlertController (title: "Игра окончен", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            //генерируем случайное число
            self.number = Int.random(in: 1...50)
            //передаем значение случайного числа в label
            self.label.text = String(self.number)
        }
    override func viewDidLoad() {
            super.viewDidLoad()
            print("viewDidLoad")
            //генерируем случайное число
            self.number = Int.random(in: 1...50)
            //устанавливаем загадочное число в метку
            self.label.text = String(self.number)
            
        }

    }

        
    




