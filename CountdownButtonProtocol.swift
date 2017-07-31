//
//  CountdownButtonProtocol.swift
//
//  Created by doluvor on 2017/2/9.
//  Copyright © 2017 doluvor. All rights reserved.
//

import Foundation

protocol CountdownButtonProtocol {

    var startCount: Int { get }

    func cd_startCountdown(startCount: Int, completion: @escaping () -> Void)
}

extension CountdownButtonProtocol {

    var startCount: Int {
        return 10
    }
}
