//
//  FirstVC.swift
//  Rick and Morty
//
//  Created by Лев Суханов on 01.05.2024.
//

import UIKit

class FirstVC: UIViewController {
    
    var presenter: FirstPresenter!
    
    var button: UIButton = {
       var button = UIButton()
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.setTitle("Вперед к приключениям!", for: .normal)
        button.setTitleColor(UIColor.systemPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let label: UILabel = {
       var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.green
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Добро пожаловать в мир Рика и Морти, тут вы сможете познакомиться с персонажами и удивительными локациями!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        //button.addTarget(self, action: #selector(tupOn), for: .touchUpInside)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setlabel()
        setButton()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.addTarget(self, action: #selector(tupOn), for: .touchUpInside)
    }
    
    func setlabel(){
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func setButton(){
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
extension FirstVC{
    @objc func tupOn(){
        presenter?.tupOnButton()
    }
}
extension FirstVC: FirstVCProtocol{
    
}
