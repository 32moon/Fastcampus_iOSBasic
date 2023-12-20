//
//  FrameworkListViewModel.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/12/20.
//

import Foundation
import Combine

final class FrameworkLsitViewModel {
    
    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }
    
    // Data => OutPut
    let items: CurrentValueSubject<[AppleFramework], Never>
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>
    
    // UserAction => Input
    func didSelect(at indexPath: IndexPath) {
        let item = items.value[indexPath.item]
        selectedItem.send(item)
    }
}
