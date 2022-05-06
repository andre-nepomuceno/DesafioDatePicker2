//
//  Pessoa.swift
//  DesafioDatePicker2
//
//  Created by André N. dos Santos on 04/05/22.
//

import Foundation
import UIKit

public class Pessoa {
    let nome: String
    var foto: UIImage?
    let genero: TipoGenero
    
    init(nome: String, genero: TipoGenero, data: Date) {
        self.nome = nome
        self.genero = genero
        self.foto = retornaImagemBaseadoEm(data: data, genero: genero)
    }
    
    public func retornaImagemBaseadoEm(data: Date, genero: TipoGenero) -> UIImage {
        let dataAtual = Date.now

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let stringDataDoPicker = dateFormatter.string(from: data) //Data recebida do Picker, em formato string -> Apenas Data!
        let stringDataAtual = dateFormatter.string(from: dataAtual) //Data atual, em formato string -> Apenas Data!

        ///Outras formas, para necessidades futuras:
        ///let calendar = Calendar.current
        ///let apenasData = calendar.component(.day, from: data)
        ///let intervalo = DateInterval.compare(DateInterval.init(start: data, end: Date.now))
        ///Compara por um atributo apenas dateFormatter.calendar.compare(data, to: dataAtual, toGranularity: .day )
               
        let comparacao = data.compare(dataAtual) // Compara duas datas e retorna um enum com cada possibilidades
        
        var retorno: UIImage?
        
        if stringDataDoPicker == stringDataAtual { //Se a data for igual a atual
            retorno = UIImage()
        }
        else {
            if comparacao == .orderedDescending {
                if genero == .Feminino {
                     retorno = UIImage(named: TipoImagem.mulherFuturo.rawValue)
                }
                else {
                    retorno = UIImage(named: TipoImagem.homemFuturo.rawValue)
                }
            }
            else {
                if genero == .Feminino {
                    retorno = UIImage(named: TipoImagem.mulherPassado.rawValue)
                }
                else {
                    retorno = UIImage(named: TipoImagem.homemPassado.rawValue)
                }
            }
        }

        return retorno ?? UIImage()
    }
}

public enum TipoImagem: String {
    case homemPassado = "homemTranquilo" //Pessoa
    case mulherPassado = "mulherTranquila" //Pessoa
    case homemFuturo = "homemProgramador" //programador
    case mulherFuturo = "mulherProgramadora" //programador
}

public enum TipoGenero {
    case Masculino
    case Feminino
}
