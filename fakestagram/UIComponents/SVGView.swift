//
//  SVGView.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import WebKit

class SVGView: UIView {
    let image: WKWebView = {
        let config = WKWebViewConfiguration()
        let wkv = WKWebView(frame: .zero, configuration: config)
        wkv.translatesAutoresizingMaskIntoConstraints = false
        return wkv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .purple
        //addSubview(image)
        //NSLayoutConstraint.activate([
        //    image.topAnchor.constraint(equalTo: self.topAnchor),
        //    image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        //    image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        //    image.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        //])
    }
    
    public func loadContent(from url: URL) {
        let req = URLRequest(url: url)
        image.load(req)
    }
}
