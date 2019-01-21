//
//  ViewController.swift
//  DrawSomething
//
//  Created by Anthony Lee on 1/20/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let canvas = Canvas()
    
    var stackView : UIStackView!
    
    let undoButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    let clearButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)

        return button
    }()
    
    override func loadView() {
        view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        canvas.backgroundColor = .white
        
        setConstraints()
        
    }
    
    func setConstraints(){
        stackView = UIStackView(arrangedSubviews: [undoButton, clearButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc func handleUndo(){
        canvas.undo()
    }
    
    @objc func handleClear(){
        canvas.clear()
    }


}

