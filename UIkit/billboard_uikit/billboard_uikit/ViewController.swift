//
//  ViewController.swift
//  billboard_uikit
//
//  Created by 최영호 on 2023/08/26.
//

import UIKit
protocol datadelegate{
    func send_data(_ data : UIColor)
    func send_background(_ data : UIColor)
    func send_text_string(_ data : String)
}

class ViewController: UIViewController, datadelegate{
    func send_text_string(_ data: String) {
        main_label.text = data
    }
    
    
    static var background_get_color : UIColor = .white
    static var text_get_color : UIColor = .red
    static var text_context : String = "test"
    
    func send_background(_ data: UIColor) {
        back_ground.backgroundColor = data
    }
    
    func send_data(_ data: UIColor) {
        main_label.textColor = data
    }
    
    
    
    

//    let navigationBar : UINavigationBar = {
//        let navi = UINavigationBar()
//
//        navi.translatesAutoresizingMaskIntoConstraints = false
////        navi.backgroundColor = .yellow
//        return navi
//    }()
    
    
    
    
    let top_view : UIView = {
        let top_view = UIView()
        top_view.translatesAutoresizingMaskIntoConstraints = false
        top_view.backgroundColor = .yellow
        return top_view
    }()
    
    let main_label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text_context
        label.textColor = text_get_color
        return label
    }()
    
    let back_ground : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let right_btn = UIBarButtonItem(title: "설정", style: .plain, target: self, action: #selector(navi_right_btn))
        
        self.view.backgroundColor = ViewController.background_get_color
        
        self.title = "navi 1"
        self.navigationController?.navigationBar.backgroundColor = .yellow
//        naviItem.rightBarButtonItem = right_btn

        navigationItem.rightBarButtonItem = right_btn
        view.addSubview(top_view)
        view.addSubview(back_ground)
        back_ground.addSubview(main_label)
//        view.addSubview(navigationBar)

//        navigationBar.setItems([naviItem], animated: true)
        autolayout()
        
        
    }

    func autolayout(){
        NSLayoutConstraint.activate([
            top_view.topAnchor.constraint(equalTo: super.view.topAnchor),
            top_view.leftAnchor.constraint(equalTo: super.view.leftAnchor),
            top_view.rightAnchor.constraint(equalTo: super.view.rightAnchor),
            top_view.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            back_ground.topAnchor.constraint(equalTo: top_view.bottomAnchor),
            back_ground.leftAnchor.constraint(equalTo: super.view.leftAnchor),
            back_ground.rightAnchor.constraint(equalTo: super.view.rightAnchor),
            back_ground.bottomAnchor.constraint(equalTo: super.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            main_label.centerXAnchor.constraint(equalTo: back_ground.centerXAnchor),
            main_label.centerYAnchor.constraint(equalTo: back_ground.centerYAnchor)
        ])
    }
    
    @objc func navi_right_btn(){
        print("tab")
        
        let setting_view = settingView()
        setting_view.delegate = self
        self.navigationController?.pushViewController(setting_view, animated: true)
        
    }

}


