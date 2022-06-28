//
//  ViewController.swift
//  01views-customlayoutguides
//
//  Created by Glenn Adams on 6/28/22.
//

import UIKit

class RootViewController: UIViewController {
    
    let vred:UIView = UIView()
    let vblue = UIView()
    let vpurple = UIView()
    var vgreen = UIView()
    var guides = [UILayoutGuide]()
    var views = [UIView]()
  
    override func viewDidLoad() {
        view.addSubview(vred)
        view.addSubview(vgreen)
        view.addSubview(vblue)
        view.addSubview(vpurple)
        
        views.append(vred)
        views.append(vgreen)
        views.append(vblue)
        views.append(vpurple)
        
        vred.translatesAutoresizingMaskIntoConstraints = false
        vblue.translatesAutoresizingMaskIntoConstraints = false
        vgreen.translatesAutoresizingMaskIntoConstraints = false
        vpurple.translatesAutoresizingMaskIntoConstraints = false
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemCyan
        self.vred.backgroundColor = UIColor.red
        self.vblue.backgroundColor = UIColor.blue
        self.vgreen.backgroundColor = UIColor.green
        self.vpurple.backgroundColor = UIColor.purple
        
        
        vred.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        vpurple.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        for eachview in views {
            
            eachview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            eachview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            eachview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        // 3 guides are needed
        for _ in views.dropLast() {
            let g = UILayoutGuide()
            self.view.addLayoutGuide(g)
            guides.append(g)
        }
        
        let anc = self.view.leadingAnchor // left margin
        // guides left and width are arbitrary
        
        for g in guides {
            g.leadingAnchor.constraint(equalTo: anc).isActive = true
            g.widthAnchor.constraint(equalToConstant: 10).isActive = true
        }
        // view
        // guide
        // view
        // guice
        // view
        // guide
        // view
        
        // guides top to prevvioous view ABOVE IT'S  bottom
        for (v,g) in zip(views.dropLast(), guides) {
            v.bottomAnchor.constraint(equalTo: g.topAnchor).isActive = true
            
        }
        //guides bottom to next view  view top (
        
        for (v,g) in zip(views.dropFirst(), guides ) {
            v.topAnchor.constraint(equalTo: g.bottomAnchor).isActive = true
            
        }
        // the guide heights equal each other
        
        let h = guides[0].heightAnchor
        for g in guides.dropFirst() {
            g.heightAnchor.constraint(equalTo: h).isActive = true
        }
    }


}

/*
var guides = [UILayoutGuide]()
// one fewer guides than views
for _ in views.dropLast() {
    let g = UILayoutGuide()
    self.view.addLayoutGuide(g)
    guides.append(g)
}
// guides leading and width are arbitrary
let anc = self.view.leadingAnchor
for g in guides {
    g.leadingAnchor.constraint(equalTo:anc).isActive = true
    g.widthAnchor.constraint(equalToConstant:10).isActive = true
}
// guides top to previous view
for (v,g) in zip(views.dropLast(), guides) {
    v.bottomAnchor.constraint(equalTo:g.topAnchor).isActive = true
}
// guides bottom to next view
for (v,g) in zip(views.dropFirst(), guides) {
    v.topAnchor.constraint(equalTo:g.bottomAnchor).isActive = true
}
// guide heights equal to each other!
let h = guides[0].heightAnchor
for g in guides.dropFirst() {
    g.heightAnchor.constraint(equalTo:h).isActive = true
}

*/

