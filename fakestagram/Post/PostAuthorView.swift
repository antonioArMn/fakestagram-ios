//
//  Author.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

@IBDesignable //Para que lo podamos editar como storyboard
class PostAuthorView: UIView {
    //Propiedades: Author, Avatar y Label
    var author: Author? {
        didSet{updateView()}
    }
    
    let avatarView: SVGView = {
        let svg  = SVGView()
        svg.translatesAutoresizingMaskIntoConstraints = false
        return svg
    }()
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem Ipsum"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        //avatarView
        addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            avatarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            avatarView.widthAnchor.constraint(equalToConstant: 52)
        ])
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = 26
        
        //nameLbl
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            nameLbl.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            nameLbl.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func updateView() {
        guard let author = self.author else {return}
        nameLbl.text = author.name
        avatarView.loadContent(for: author.avatarURL())
    }
}
