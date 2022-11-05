//
//  ViewController.swift
//  autolayout
//
//  Created by 최영호 on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var qutoes :UILabel!
    
    
    let quotes1 = [
        quosus(con : "인생은 지긋지긋한 일의 반복이다." , name : "엘버트 허버드"),
        quosus(con : "긴 인생은 충분히 좋지 않을 수도 있다,\n 그러나 좋은 인생은 충분히 길다." , name : "벤자민 프랭클린"),
        quosus(con : "세상에는 일곱 가지 죄가 있다. 노력 없는 부,\n 양심 없는 쾌락, 인격 없는 지식, 도덕성 없는 상업,\n 인성 없는 과학, 희생 없는 기도,\n 원칙 없는 정치가 그것이다." , name : "마하트마 간디"),
        quosus(con : "asdasdasdasd4" , name : "io4"),
    ]
    let qutoes = UILabel()
    let name = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let safearea = view.safeAreaLayoutGuide
        
        let toplabel = UILabel()
        view.addSubview(toplabel)
        toplabel.text = "명언 생성기"
        toplabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        toplabel.translatesAutoresizingMaskIntoConstraints = false
//        toplabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        toplabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        toplabel.topAnchor.constraint(equalTo: safearea.topAnchor, constant: 20).isActive = true
//        toplabel.leadingAnchor.constraint(equalTo: safearea.leadingAnchor, constant: 20).isActive = true
        
        let back = UIView()
        view.addSubview(back)
        
        back.backgroundColor = UIColor.systemGray
        back.translatesAutoresizingMaskIntoConstraints = false
        back.topAnchor.constraint(equalTo: toplabel.bottomAnchor, constant: 20).isActive = true
        back.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //back.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //back.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 20).isActive = true
        back.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        back.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        back.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        //let qutoes = UILabel()
        back.addSubview(qutoes)
        qutoes.translatesAutoresizingMaskIntoConstraints = false
        qutoes.text = ""
        qutoes.numberOfLines = 0
        qutoes.topAnchor.constraint(equalTo: back.topAnchor, constant: 20).isActive = true
        //qutoes.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //qutoes.widthAnchor.constraint(equalToConstant: 50).isActive = true
        qutoes.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 20).isActive = true
        
        //let name = UILabel()
        back.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = ""
        name.topAnchor.constraint(equalTo: qutoes.bottomAnchor, constant: 20).isActive = true
        name.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 20).isActive = true
        
        
        
        self.view.backgroundColor = .systemBrown
        
        let btn = UIButton()
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: back.bottomAnchor, constant: 20).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(btnConfirmPressed(_:)), for: .touchUpInside)
        
        
    }
    
    //@IBOutlet var name:UILabel!
    
    @objc func btnConfirmPressed(_ button: UIButton) {
        print("random number: \(Int.random(in: 0...4))")
        var ran = Int.random(in: 0...3)
        print(quotes1[ran].con)
        self.qutoes.text = quotes1[ran].con
        self.name.text = quotes1[ran].name
        
    }
    

}

#if DEBUG

import SwiftUI

struct ViewcontrollerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewcontrollerPresentable_PreviewProvider : PreviewProvider{
    static var previews: some View{
        ViewcontrollerPresentable()
            .ignoresSafeArea()
    }
}

#endif
