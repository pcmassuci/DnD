//
//  Bindable.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

class Bindable<T> {
    typealias BindType = ((T) -> Void)
    
    // MARK: - Properties
    
    private var binds: [BindType] = []
    
    /// Valor bruto dinâmico
    var value: T {
        didSet {
            execBinds()
        }
    }
    
    // MARK: - Initialize
    
    /// Inicializador
    ///
    /// - Parâmetro val: valor dinâmico inicial
    init(_ val: T) {
        value = val
    }
    
    // MARK: - Public Methods
    
    /// Valor de ligação para alterações
    ///
    /// - Parameters:
    ///   - skip: Deve ignorar a chamada de encerramento do initil
    ///   - bind: closure para executar valor de tempo alterado
    func bind(skip: Bool = false, _ bind: @escaping BindType) {
        binds.append(bind)
        if skip { return }
        bind(value)
    }
    
    // MARK: - Private Methods
    
    private func execBinds() {
        binds.forEach { [unowned self] bind in
            bind(self.value)
        }
    }
}
