//
//  test_view_controller.swift
//  billboard_uikit
//
//  Created by 최영호 on 2023/08/29.
//

import Foundation
import UIKit

protocol DataDelegate: AnyObject{
    func sendData(_ data: String)
}

class vc1 : ViewController, DataDelegate{
    
    func sendData(_ data: String) {
        label.text = data
    }
    
    
    let label : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "asd"
        return label
    }()
    
    let btn : UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        return btn
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(btn_click), for: .touchUpInside)
        
        auto()
    }
    
    func auto(){
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: super.view.centerYAnchor),
            
            btn.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            btn.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 125),
            btn.widthAnchor.constraint(equalToConstant: 150)
            
            
        ])
    }
    
    @objc func btn_click(){
        print("tap")
        let vc = vc2()
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

class vc2 : ViewController{
    var delegate : DataDelegate?
    
    var btn : UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle("click", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(click_btn), for: .touchUpInside)
        auto()
    }
    
    @objc func click_btn(){
        delegate?.sendData("change word")
        print("diss ")
        dismiss(animated: true)
    }
    
    func auto(){
        NSLayoutConstraint.activate([
            btn.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: super.view.centerYAnchor)
        ])
    }
}
