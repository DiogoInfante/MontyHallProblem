//
//  PickerType.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 25/12/21.
//

import Foundation

/// Picker Types: There are three variables that may be changed in experiments
///     - numberOfDoors: It will have this number of doors
///     - secondChoice: It will always make this second choice
///     - repetitions: It will run the experiment n times
enum PickerType {
    case numberOfDoors
    case secondChoice
    case repetitions
}
