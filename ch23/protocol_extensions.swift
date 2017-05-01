import Foundation

protocol Exercise: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
}
extension Exercise {
    var description: String {
        let cals = caloriesBurned
        let mins = minutes
        return "Exercise \(name): burned \(cals) calories in \(mins) minutes"
    }
}
extension Exercise {
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}
struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
    let title = "Workout using the Go Fast Elliptical Trainer 3000"
    let caloriesBurned: Double
    let minutes: Double
}
let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335,
                                          minutes: 30)
struct TreadmillWorkout: Exercise {
    let name = "Treadmill Workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
}
extension TreadmillWorkout {
    var description: String {
        let c = caloriesBurned
        let m = minutes
        let l = laps
        return "TreadMillWorkout: \(c) calories, \(l) laps in \(m) minutes"
    }
}
let runningWorkout = TreadmillWorkout(caloriesBurned: 350,
                                      minutes: 25,
                                      laps: 10.5)
extension Exercise {
    var caloriesBurnedPerMinute: Double { return caloriesBurned / minutes }
}
// Output
let workouts: [Exercise] = [ellipticalWorkout, runningWorkout]
workouts.forEach {
    let s = String(repeating: "=", count: 50)
    print(s)
    print($0.title)
    print("Calories burned per/min: \($0.caloriesBurnedPerMinute)")
    print(s)
}
extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        return self.reduce(0.0) { $0 + $1.caloriesBurned }
    }
}
print("Total calories burned: \(workouts.totalCaloriesBurned())")
