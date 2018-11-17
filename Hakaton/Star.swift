//
//  Star.swift
//  Hakaton
//
//  Created by Silchenko on 17.11.2018.
//  Copyright © 2018 Silchenko. All rights reserved.
//

import UIKit

class Star: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
        addGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGesture()
    }

    private func addGesture() {
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(Star.starTapped))
        self.addGestureRecognizer(tap)
    }
    
    @objc func starTapped() {
        print("tap")
    }
}
