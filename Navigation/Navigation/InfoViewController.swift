//
//  InfoViewController.swift
//  Navigation
//
//  Created by Юрий Филатов on 08.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private let alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 180, height: 55))
        button.setTitle("Show alert", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(alertButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alertButton.center = view.center
    }
    
    @objc func showAlert() {
        infoAlert()
    }
    
    func infoAlert(){
        let alert = UIAlertController(title: "Что-то важное", message: "Тут должно быть что-то важное, но мы забыли это написать!((", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ну ладно", style: .cancel, handler: { action in
        }))
        present(alert, animated: true)
    }

}
