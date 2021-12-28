//
//  ExperimentVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Experiment View Controller
/// On this page is possible to simulate multiple cases of monty hall problem
class ExperimentVC: BaseViewController<ExperimentView>, ExperimentDelegate {
    /// Array with all possible number of doors
    let numberOfDoors: [Int] = [3,4,5,6,7,8,9,10,15,20,25,50,100,250,500,1000]
    /// Array with possible second choices
    let secondChoices: [SecondChoice] = [.keepDoor, .switchDoor]
    /// Array with all possible number of repetitions
    let repetitions: [Int] = [1,10,100,500,1000,10000]
    /// Selected number of doors
    var selectedNumberOfDoors: Int = 3
    /// Selected second choice
    var selectedSecondChoice: SecondChoice = .keepDoor
    /// Selected number of repetitions
    var selectedRepetitions: Int = 100
    /// Initializes a ExperimentVC.
    init() {
        super.init(scene: ExperimentView())
    }
    /// View did load cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.contentView.update(.smoothBackground)
        /// Delegates
        set(delegate: self)
        /// Scene setup
        view.addSubview(scene)
        scene.setScene(root: contentView)
    }
    /// Runs an experiment - Trigged by lever delegate
    func endCourse() {
        let experiment = Experiment(numberOfDoors: selectedNumberOfDoors,
                                    secondChoice: selectedSecondChoice,
                                    rounds: selectedRepetitions)
        experiment.run()
        scene.panel.displayExperiment(results: experiment.montyHall.results)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ExperimentVC {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        for cell in scene.cells {
            switch cell.type {
            case .numberOfDoors:
                if pickerView == cell.uiPicker {
                    return numberOfDoors.count
                }
            case .secondChoice:
                if pickerView == cell.uiPicker {
                    return secondChoices.count
                }
            case .repetitions:
                if pickerView == cell.uiPicker {
                    return repetitions.count
                }
            }
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        for cell in scene.cells {
            switch cell.type {
            case .numberOfDoors:
                if pickerView == cell.uiPicker {
                    return String(numberOfDoors[row])
                }
            case .secondChoice:
                if pickerView == cell.uiPicker {
                    return secondChoices[row] == .keepDoor ? "Keep" : "Switch"
                }
            case .repetitions:
                if pickerView == cell.uiPicker {
                    return String(repetitions[row])
                }
            }
        }
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for cell in scene.cells {
            switch cell.type {
            case .numberOfDoors:
                if pickerView == cell.uiPicker {
                    selectedNumberOfDoors = numberOfDoors[row]
                    cell.textField.text = String(selectedNumberOfDoors)
                }
            case .secondChoice:
                if pickerView == cell.uiPicker {
                    selectedSecondChoice = secondChoices[row]
                    cell.textField.text = secondChoices[row] == .keepDoor ? "Keep" : "Switch"
                }
            case .repetitions:
                if pickerView == cell.uiPicker {
                    selectedRepetitions = repetitions[row]
                    cell.textField.text = String(repetitions[row])
                }
            }
        }
    }
}
