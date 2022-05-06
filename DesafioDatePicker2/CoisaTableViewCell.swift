//
//  CoisaTableViewCell.swift
//  DesafioDatePicker2
//
//  Created by André N. dos Santos on 04/05/22.
//

import UIKit

class CoisaTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var dataDatePicker: UIDatePicker!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func configuraCelula(pessoa: Pessoa) {
        nomeLabel.text = pessoa.nome
        fotoImageView.image = pessoa.foto
    }

}
