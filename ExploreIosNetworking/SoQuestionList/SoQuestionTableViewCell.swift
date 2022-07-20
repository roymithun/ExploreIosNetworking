//
//  SoQuestinonItemTableViewCell.swift
//  ExploreNetworking
//
//  Created by Mithun Roy on 20/07/2022.
//

import UIKit

class SoQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var soQuestionLabel: UILabel!
    
    @IBOutlet weak var viewsCount: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var questionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
