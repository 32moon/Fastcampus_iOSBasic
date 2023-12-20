//
//  FrameworkDetailViewModel.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/12/20.
//

import Foundation
import Combine

final class FrameworkDetailViewModel {
    
    init(framework: AppleFramework) {
        self.framework = CurrentValueSubject(framework)
    }
    
    let framework: CurrentValueSubject<AppleFramework, Never>
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    func learnMoreTapped() {
        buttonTapped.send(framework.value)
    }
}
