import Foundation

protocol Exercise {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}
struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
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
let runningWorkout = TreadmillWorkout(caloriesBurned: 350,
                                      minutes: 25,
                                      laps: 10.5)
extension Exercise {
    var caloriesBurnedPerMinute: Double { return caloriesBurned / minutes }
}
let workouts: [Exercise] = [ellipticalWorkout, runningWorkout]
workouts.forEach {
    let cbpm = $0.caloriesBurnedPerMinute
    print("Calories burned per/min in \($0.name): \(cbpm)")
}
extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        return self.reduce(0.0) { $0 + $1.caloriesBurned }
    }
}
print("Total calories burned: \(workouts.totalCaloriesBurned())")
