//
//  ViewController.swift
//  DesafioDatePicker2
//
//  Created by André N. dos Santos on 04/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coisaTableview: UITableView!
        
    var listaPessoas: [Pessoa] = [
        Pessoa(nome: "José", genero: .Masculino, data: Date.now),
        Pessoa(nome: "Maria", genero: .Feminino, data: Date.now),
        Pessoa(nome: "Mário", genero: .Masculino, data: Date.now),
        Pessoa(nome: "Josefina", genero: .Feminino, data: Date.now),
        Pessoa(nome: "Carlos", genero: .Masculino, data: Date.now),
        Pessoa(nome: "Carla", genero: .Feminino, data: Date.now),
        Pessoa(nome: "Chico", genero: .Masculino, data: Date.now),
        Pessoa(nome: "Chica", genero: .Feminino, data: Date.now),
        Pessoa(nome: "Serafin", genero: .Masculino, data: Date.now),
        Pessoa(nome: "Serafina", genero: .Feminino, data: Date.now),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coisaTableview.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "pessoaCell", for: indexPath) as? PessoaTableViewCell {
            cell.configuraCelula(pessoa: listaPessoas[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
