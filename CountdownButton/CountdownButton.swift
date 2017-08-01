//
//  CountdownButton.swift
//
//  Created by doluvor on 2017/2/9.
//  Copyright © 2017 doluvor. All rights reserved.
//

import UIKit

class CountdownButton: UIButton, CountdownButtonProtocol {

    var timer: DispatchSourceTimer?

    var count = 0

    var normalTitle: String?

    var startCount = 10

    override init(frame: CGRect) {

        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        commonInit()
    }

    func commonInit() {

    }

    func cd_startCountdown(startCount: Int = 60, completion: @escaping () -> Void) {

        self.startCount = startCount

        timer?.cancel()

        let queue = DispatchQueue(label: "com.doluvor.ui.countdownbutton.timer", attributes: .concurrent)

        timer = DispatchSource.makeTimerSource(queue: queue)

        timer?.scheduleRepeating(deadline: .now(), interval: .seconds(1), leeway: .seconds(0))

        timer?.setEventHandler { [weak self] () -> Void in

            DispatchQueue.main.async {

                if self?.count == 0 {

                    if let normalTitle = self?.normalTitle {
                        self?.setTitle(normalTitle, for: .normal)
                    }

                    self?.timer?.cancel()
                    self?.timer = nil

                    completion()

                } else {

                    print(self!.count)
                    self?.setTitle("\(self!.count)s left", for: .normal)

                    self?.count -= 1
                }
            }
        }

        count = startCount
        normalTitle = title(for: .normal)

        timer?.resume()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
