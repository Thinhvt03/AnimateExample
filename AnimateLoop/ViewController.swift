//
//  ViewController.swift
//  AnimateLoop
//
//  Created by Nguyễn Thịnh on 03/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .red
        return myView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.center = view.center
        view.addSubview(myView)
        
    }
    
    func animateView() {
        UIView.animate(withDuration: 5) { [weak self] in
            self?.myView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            self?.myView.center = (self?.view.center)!
            self?.myImageView.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        } completion: { _ in
            self.shrink()
        }
    }
    
    func shrink() {
        UIView.animate(withDuration: 5) { [weak self] in
            self?.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            self?.myView.center = (self?.view.center)!
            self?.myImageView.frame = CGRect(x: 700, y: 100, width: 100, height: 100)
        } completion: { _ in
            self.animateView()
        }
    }
}

