//
//  ViewController.swift
//  Life_quotes
//
//  Created by 최영호 on 2023/08/26.

import UIKit

struct quotes{
    let content : String
    let name:String
}

  

class ViewController: UIViewController {
    let str_array : [quotes] = [quotes(content: "난 멋져", name: "나"), quotes(content: "넌 이겨", name: "너"), quotes(content: "암더 킹", name: "왕")]
    var current_count : Int = 0
    let top_text : UILabel = {
        let text = UILabel()
        text.text = "명언 생성기"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        return text
    }()
    
    let inner_view : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    let inner_view_text_1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let inner_view_text_2 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let button_text : UILabel = {
        let label = UILabel()
        label.text = "button"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(ciColor: .white)
        
        
        view.addSubview(top_text)
        view.addSubview(inner_view)
        view.addSubview(button)
        inner_view.addSubview(inner_view_text_1)
        inner_view.addSubview(inner_view_text_2)
        button.addSubview(button_text)
        button.addTarget(self, action: #selector(button_action), for: .touchDown)
        
        
        auto_layout()
    }
    
    @objc func button_action(){
        print("tap")
        inner_view_text_1.text = str_array[current_count].content
        inner_view_text_2.text = str_array[current_count].name
        if current_count == 2{
            current_count = 0
        }else{
            current_count += 1
        }
    }
    
    func auto_layout(){
        
        NSLayoutConstraint.activate([
            top_text.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 100),
            top_text.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 50),
            top_text.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -50),
                        
            
            inner_view.topAnchor.constraint(equalTo: top_text.bottomAnchor, constant: 20),
            inner_view.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 20),
            inner_view.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -20),
            inner_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -500),
            
            button.topAnchor.constraint(equalTo: inner_view.bottomAnchor, constant: 100),
            button.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 100),
            button.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -100),
            
            
            
            
            inner_view_text_1.topAnchor.constraint(equalTo: inner_view.topAnchor),
            inner_view_text_1.leftAnchor.constraint(equalTo: inner_view.leftAnchor),
            
            inner_view_text_2.topAnchor.constraint(equalTo: inner_view_text_1.bottomAnchor),
            inner_view_text_2.leftAnchor.constraint(equalTo: inner_view.leftAnchor)
//            button.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -400)
        ])
    }
    


}

