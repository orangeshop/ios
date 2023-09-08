//
//  ViewController.swift
//  calculator
//
//  Created by 최영호 on 2023/09/08.
//

import UIKit

class ViewController: UIViewController {

    var first_num : Int = 0
    var sign : String = ""
    var second_num : Int = 0
    
    
    var main_label : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 80)
        label.backgroundColor = .yellow
        return label
    }()
    
    var circle_view : [UIButton] = {
        var arr : [UIButton] = []
        
        for i in 0 ..< 15{
            var btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
            btn.setImage(UIImage(systemName: "circle.fill"), for: .application)
            
            btn.setTitle("\(i)", for: .normal)
            btn.tag = i
            if(i == 3 || i == 7 || i == 11 || i == 13 || i == 14 || i == 12){
                if(i == 14){
                    btn.setTitle("+", for: .normal)
                    btn.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 0/255, alpha: 1)
                }
                else if(i == 3){
                    btn.setTitle("-", for: .normal)
                    btn.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 0/255, alpha: 1)
                }
                else if(i == 7){
                    btn.setTitle("*", for: .normal)
                    btn.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 0/255, alpha: 1)
                }
                else if(i == 11){
                    btn.setTitle("/", for: .normal)
                    btn.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 0/255, alpha: 1)
                }
                else if(i == 13){
                    btn.setTitle("=", for: .normal)
                    btn.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 0/255, alpha: 1)
                }
                else if(i == 12){
                    btn.setTitle(".", for: .normal)
                }
            }
            
            if(i == 0 || i == 1 || i == 2){
                btn.setTitle("\(i + 1)", for: .normal)
            }
            
            if(i == 8 || i == 9 || i == 10){
                btn.setTitle("\(i - 1)", for: .normal)
            }
            
            btn.addTarget(self, action: #selector(btn_clcik), for: .touchUpInside)
            arr.append(btn)
        }
        
        return arr
    }()
    
    var capsule_view : [UIButton] = {
        var arr : [UIButton] = []
        
        for i in 0 ..< 2{
            var btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .systemPink
            btn.setImage(UIImage(systemName: "circle.fill"), for: .application)
            
            if(i == 0){
                btn.setTitle("AC", for: .normal)
                btn.backgroundColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
                btn.setTitleColor(.black, for: .normal)
                btn.tag = 20
            }
            else{
                btn.setTitle("0", for: .normal)
                btn.backgroundColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
                btn.tag = 21
            }
            
            btn.addTarget(self, action: #selector(btn_clcik), for: .touchUpInside)
            arr.append(btn)
        }
        
       
        
        return arr
    }()
    
    @objc func btn_clcik(sender : UIButton){
        print(sender.tag)
        print("click \(sender)")
        
        if(sender.tag == 20){
            main_label.text! = ""
        }
        else if(sender.tag == 21){
            main_label.text! += "0"
        }
        
        if(sender.tag == 3 || sender.tag == 7 || sender.tag == 11 || sender.tag == 13 || sender.tag == 14 || sender.tag == 12){
            if(sender.tag == 14){
                first_num = Int(String(main_label.text!))!
                print(first_num)
                main_label.text! = ""
                sign = "+"
            }
            else if(sender.tag == 3){
                first_num = Int(String(main_label.text!))!
                main_label.text! += ""
                sign = "-"
            }
            else if(sender.tag == 7){
                first_num = Int(String(main_label.text!))!
                main_label.text! += ""
                sign = "*"
            }
            else if(sender.tag == 11){
                first_num = Int(String(main_label.text!))!
                main_label.text! += ""
                sign = "/"
            }
            else if(sender.tag == 13){
                second_num = Int(String(main_label.text!))!
                
                if(sign == "*"){
                    main_label.text! = "\(first_num * second_num)"
                }
                
                if(sign == "+"){
                    main_label.text! = "\(first_num + second_num)"
                }
                
                if(sign == "-"){
                    main_label.text! = "\(first_num - second_num)"
                }
                
                if(sign == "/"){
                    main_label.text! = "\(first_num / second_num)"
                }
            }
            else if(sender.tag == 12){
                main_label.text! += "."
                sign = "."
            }
        }
        
        if(sender.tag == 0 || sender.tag == 1 || sender.tag == 2){
            
            if(main_label.text == "0"){
                main_label.text! = ""
            }
            main_label.text! += "\(sender.tag + 1)"
        }
        
        if(sender.tag == 8 || sender.tag == 9 || sender.tag == 10){
            if(main_label.text == "0"){
                main_label.text! = ""
            }
            main_label.text! += "\(sender.tag - 1)"
        }
        
        
        
    }
    
    
    var ver_stack : UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
//        stack.backgroundColor = .black
        return stack
    }()
    
    var hor_stack : [UIStackView] = {
        var arr : [UIStackView] = []
        var color : [UIColor] = [.red, .green, .blue, .purple, .systemPink]
        for i in 0 ..< 5{
            var stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.distribution = .fillEqually
            stack.spacing = 10
//            stack.backgroundColor = color[i]
            arr.append(stack)
        }
        
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(main_label)
        
        view.addSubview(ver_stack)
        
       
        view.addSubview(capsule_view[0])
        view.addSubview(capsule_view[1])
        view.addSubview(circle_view[12])
        view.addSubview(circle_view[13])
        view.addSubview(circle_view[14])
        
        for i in 0 ..< 3{
            ver_stack.addArrangedSubview(hor_stack[i])

            
            for k in 0 ..< 4{
                print("i : \(i) k : \(k)")
                hor_stack[i].addArrangedSubview(circle_view[((i) * 4) + k])
            }
            
        }

        
        autolayout()
    }

    func autolayout(){
        NSLayoutConstraint.activate([
            main_label.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 150),
            main_label.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 50),
            main_label.heightAnchor.constraint(equalToConstant: 100),
            main_label.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            capsule_view[0].topAnchor.constraint(equalTo: main_label.bottomAnchor, constant: 30),
            capsule_view[0].leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 30),
            capsule_view[0].widthAnchor.constraint(equalToConstant: 247),
            capsule_view[0].heightAnchor.constraint(equalToConstant: 80),
            
            circle_view[14].leftAnchor.constraint(equalTo: capsule_view[0].rightAnchor, constant: 10),
            circle_view[14].topAnchor.constraint(equalTo: main_label.bottomAnchor, constant: 30),
            circle_view[14].widthAnchor.constraint(equalToConstant: 75),
            circle_view[14].heightAnchor.constraint(equalToConstant: 80),
            
            
            
        ])
        
        NSLayoutConstraint.activate([
            ver_stack.topAnchor.constraint(equalTo: capsule_view[0].bottomAnchor, constant: 10),
            ver_stack.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 30),
            ver_stack.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -30),
            ver_stack.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            capsule_view[1].topAnchor.constraint(equalTo: ver_stack.bottomAnchor, constant: 10),
            capsule_view[1].leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 30),
            capsule_view[1].widthAnchor.constraint(equalToConstant: 163),
            capsule_view[1].heightAnchor.constraint(equalToConstant: 80),
            
            circle_view[12].leftAnchor.constraint(equalTo: capsule_view[1].rightAnchor, constant: 10),
            circle_view[12].topAnchor.constraint(equalTo: ver_stack.bottomAnchor, constant: 10),
            circle_view[12].widthAnchor.constraint(equalToConstant: 75),
            circle_view[12].heightAnchor.constraint(equalToConstant: 80),
            
            circle_view[13].leftAnchor.constraint(equalTo: circle_view[12].rightAnchor, constant: 10),
            circle_view[13].topAnchor.constraint(equalTo: ver_stack.bottomAnchor, constant: 10),
            circle_view[13].widthAnchor.constraint(equalToConstant: 75),
            circle_view[13].heightAnchor.constraint(equalToConstant: 80),
            
            
            
        ])
        
        
    }

}

