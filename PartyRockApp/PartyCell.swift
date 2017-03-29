//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Piotr Piotrowski on 29/03/2017.
//  Copyright © 2017 Piotr Piotrowski. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateUI(partRock: PartyRock) {
        videoTitle.text = partRock.videoTitle
        
        let url = URL(string: partRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
    }
    
}
