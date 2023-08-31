//
//  setting_view_contoller.swift
//  billboard_uikit
//
//  Created by 최영호 on 2023/08/27.
//

import Foundation
import UIKit
import SwiftUI

let background_color : [Color] = [.red,.green,.blue]
let text_color : [Color] = [.purple,.orange,.pink]


class settingView : UIViewController, UITextFieldDelegate{

    var delegate : datadelegate?
    
    let all_round_stack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis              = .vertical
//        stack.alignment = .center
//        stack.backgroundColor   = .blue
        stack.distribution      = .fillEqually
        stack.spacing           = 20
        return stack
    }()
    
    let text_field_stack : UIStackView = {
        let stack_view = UIStackView()
        stack_view.translatesAutoresizingMaskIntoConstraints = false
        stack_view.axis             = .vertical
        stack_view.distribution     = .fillEqually
//        stack_view.alignment = .leading
        stack_view.spacing          = 20
//        stack_view.backgroundColor  = .red
        return stack_view
    }()
    
    let background_color_stack : UIStackView = {
        let stack_view = UIStackView()
        stack_view.translatesAutoresizingMaskIntoConstraints = false
        stack_view.axis = .vertical
//        stack_view.distribution = .fill
//        stack_view.alignment = .leading
        stack_view.backgroundColor = .yellow
        return stack_view
    }()
    
    let backgound_color_horizental_stack : UIStackView = {
        let stack = UIStackView()
        stack.spacing                                   = 5
        stack.distribution                              = .fillEqually
        stack.axis                                      = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let text_color_stack : UIStackView = {
        let stack_view = UIStackView()
        stack_view.translatesAutoresizingMaskIntoConstraints = false
        stack_view.axis = .vertical
//        stack_view.distribution = .fill
//        stack_view.alignment = .leading
        stack_view.backgroundColor = .green
        return stack_view
    }()
    
    let text_color_horizental_stack : UIStackView = {
        let stack = UIStackView()
        stack.spacing                                   = 5
        stack.distribution                              = .fillEqually
        stack.axis                                      = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let top_label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "전광판에 표시할 글자"
        return label
    }()
    
    let text_field : UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "원하는 글자를 입력"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let background_color_label : UILabel = {
        let label = UILabel()
        label.text = "배경 색상 설정"
        return label
    }()
    
    
    let text_color_label : UILabel = {
        let label = UILabel()
        label.text = "텍스트 색상 설정"
        return label
    }()
    
    let background_circle_view : [UIButton] = {
        
        var btns : [UIButton] = []

        for i in 0..<3{
            
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            btn.setTitle("sadasd \(i)", for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(background_tap), for: .touchUpInside)

            btn.layer.cornerRadius = 30
            print(background_color[i])
            btn.backgroundColor = UIColor(background_color[i])
            btns.append(btn)
            
        }
        return btns
    }()
    
    @objc func background_tap(sender : UIButton){
       
        print(sender.tag)
        delegate?.send_background(UIColor(background_color[sender.tag]))
        
    }
    

    let text_circle_view : [UIButton] = {
        
        var btns : [UIButton] = []

        for i in 0..<3{
            
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            btn.setTitle("sadasd \(i)", for: .normal)
            btn.tag = i
            btn.addTarget(self, action: #selector(text_tap), for: .touchUpInside)

            btn.layer.cornerRadius = 30
            print(text_color[i])
            btn.backgroundColor = UIColor(text_color[i])
            btns.append(btn)
            
        }
        return btns
    }()
    
    @objc func text_tap(sender : UIButton){
       
        print(sender.tag)
        print(text_color[sender.tag])
//        print(ViewController.text_get_color)
        delegate?.send_data(UIColor(text_color[sender.tag]))
//        delegate?.send_data("창모는 돈벌어")
        
        
        print("\(text_field.text)")
       
    }
    
    let save_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("저장", for: .normal)
        return btn
    }()
    
    @objc func objc_save(){
        print("저장 됨")
        delegate?.send_text_string("\(text_field.text!)")
    }
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(all_round_stack)
        view.addSubview(save_btn)
        text_field.delegate = self
         
        all_round_stack.addArrangedSubview(text_field_stack)
        all_round_stack.addArrangedSubview(background_color_stack)
        all_round_stack.addArrangedSubview(text_color_stack)
        
        text_field_stack.addArrangedSubview(top_label)
        text_field_stack.addArrangedSubview(text_field)
        
        background_color_stack.addArrangedSubview(background_color_label)
        background_color_stack.addArrangedSubview(backgound_color_horizental_stack)
        
        for i in 0 ..< 3{
            
            backgound_color_horizental_stack.addArrangedSubview(background_circle_view[i])
            
            text_color_horizental_stack.addArrangedSubview(text_circle_view[i])
        }
        
        text_color_stack.addArrangedSubview(text_color_label)
        text_color_stack.addArrangedSubview(text_color_horizental_stack)
        
        save_btn.addTarget(self, action: #selector(objc_save), for: .touchUpInside)
        
        all_round_stack_auto_layout()
        
    }
    
    func all_round_stack_auto_layout(){
        NSLayoutConstraint.activate([
            all_round_stack.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 130),
            all_round_stack.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 20),
            all_round_stack.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -20),
            all_round_stack.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -350)
        ])
        
        NSLayoutConstraint.activate([
            save_btn.topAnchor.constraint(equalTo: all_round_stack.bottomAnchor, constant: 20),
            save_btn.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 50),
            save_btn.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -50),
            save_btn.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -100)
        ])
    }
    
    func text_field_stack_auto_layout(){
        NSLayoutConstraint.activate([
            text_field_stack.topAnchor.constraint(equalTo: all_round_stack.topAnchor, constant: 20),
            text_field_stack.leftAnchor.constraint(equalTo: all_round_stack.leftAnchor, constant: 20),
            text_field_stack.rightAnchor.constraint(equalTo: all_round_stack.rightAnchor, constant: -20),
            text_field_stack.bottomAnchor.constraint(equalTo: all_round_stack.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            top_label.topAnchor.constraint(equalTo: text_field_stack.topAnchor, constant: 20),
            top_label.leftAnchor.constraint(equalTo: text_field_stack.leftAnchor, constant: 20),
            top_label.heightAnchor.constraint(equalToConstant: 20),
            top_label.widthAnchor.constraint(equalToConstant: 30),
            
            text_field.topAnchor.constraint(equalTo: top_label.bottomAnchor, constant: 20),
            text_field.leftAnchor.constraint(equalTo: text_field_stack.leftAnchor, constant: 20),
            text_field.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}


