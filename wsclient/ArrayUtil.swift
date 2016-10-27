//
//  ArrayUtil.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

extension Array {
    mutating func removeAtIndices(set: IndexSet) {
        set.sorted(by: >).forEach { remove(at: $0) }
    }
}
