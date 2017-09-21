
/*:
 Enumerations (`enum`s) are a very powerful and useful construct in the `Swift` language. They help you to express the _semantics_ of your code very explicitly and let the compiler help you to enforce them.
 
 Generally, `enum`s are a way to model a type that can only contain a limited range of values. Let's step back and consider for a second what that means. A _type_ in a programming language describes a range of _values_. Let's consider a few examples:
 
 The type `Bool` that you all know has 2 different values, namely `true` and `false`. `UInt8` in Swift has as values all _unsigned integers_ that can be created out of 8 bits, more precisely, the range of values will be all integers from 0 to 255 (because 8 ones and zeros can create 256 (= 2^8) combinations).
 
 The type `String` in Swift describes all possible sequences of characters, so it has an _infinite_ range.
 
 A custom type `Person` that looks like this
 ```
 struct Person {
   let name: String
 }
 ```
 can describe any person with any `name` (which is a `String`, so again we will have an infinite range of values for the type `Person`).
 
 So, `enum`s work particularly well whenever we want to model a type of which we know that it has a limited amount of values and we want to express this in our code.
 */

// bad model: name could be any string and the compiler can't know help us identfying invalid ones
//struct FirstQuarterTechnicalCourse {
//  let name: String
//}

// better model: we have exactly 5 Coursees in the first quarter that are known upfront; now the compiler will only allow valid coursees to be created
enum FirstQuarterTechnicalCourse {
  case python
  case frontend
  case ruby
  case ios_advanced
  case ios_accelerated
    
}

// creating enum values requires an explicit type annonation of the enum's type
let course1 = FirstQuarterTechnicalCourse.python
let course2: FirstQuarterTechnicalCourse = .frontend
//var w3 = .ruby // doesn't work because the compiler doesn't know the enum type
// var w3: FirstQuarterTechnicalCourse
// you can do regular comparisons with enums using if:
if course1 == course2 {
  print("these two are the same")
}
else {
  print("these two are different")
}

// but what's even better to use a switch statement and do pattern matching:
func getCourseName(course: FirstQuarterTechnicalCourse) -> String {
  var courseName: String
  switch course {
  case .python: courseName = "Back-end Web: API Services with Python & Flask"
  case .frontend: courseName = "Front-end Web: Interactive Websites with JavaScript"
  case .ruby: courseName = "Full-stack development with Ruby"
  case .ios_advanced: courseName = "Advanced Topics in iOS & Swift"
  case .ios_accelerated: courseName = "Mobile Apps with iOS & Swift"

  }
  return courseName
}

let courseNameForCourse1 = getCourseName(course: course1)
print("The course is called: \(courseNameForCourse1)")

// switch statements can also bundle multiple cases
func getCourseType(course: FirstQuarterTechnicalCourse) -> String {
  var courseType: String
  switch course {
    case .python, .frontend, .ruby: courseType = "Web"
    case .ios_accelerated, .ios_advanced: courseType = "Mobile"
  }
  return courseType
}
let courseTypeForCourse1 = getCourseType(course: course1)
print("The course is of type: \(courseTypeForCourse1)")

func isMobileCourse(course: FirstQuarterTechnicalCourse) -> Bool {
  switch course {
  case .ios_advanced, .ios_accelerated: return true
  default: return false
  }
}

let isMobile = isMobileCourse(course: course1)
print("The course is a mobile course: \(isMobile)")


/*:
 ### Challenges
 
 1. Model a type called `Weekday` that represents the different days of the week.
 2. Write a function called `getWeekdayName` that takes a `Weekday` returns the name of each weekday as a `String`, e.g.: `"This weekday is called Sunday."`
 3. Write a function called `isItFinallyWeekend` that takes a `Weekday` and returns a `String` indicating whether the argument is a weekend weekday, e.g.: `"Monday is a regular workday."` or `"Wuhuuuu, it's SATURDAYYYYYYYY."`
 */
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

let weekday1 = Weekday.monday
let weekday2 = Weekday.tuesday
let weekday3 = Weekday.wednesday
let weekday4 = Weekday.thursday
let weekday5 = Weekday.friday
let weekday6 = Weekday.saturday
let weekday7 = Weekday.sunday

func getWeekdayName(weekday: Weekday) -> String {
    var weekdayName: String
    switch weekday {
    case weekday1: weekdayName = "Monday"
    case weekday2: weekdayName = "Tuesday"
    case weekday3: weekdayName = "Wednesday"
    case weekday4: weekdayName = "Thursday"
    case weekday5: weekdayName = "Friday"
    case weekday6: weekdayName = "Saturday"
    case weekday7: weekdayName = "Sunday"
    default: return "What day is it?"
    }
    return "This weekday is called \(weekdayName)"
}

func isItFinallyWeekend(weekend: Weekday) -> String {
    switch weekend {
    case weekday1, weekday2, weekday3, weekday4:
        return "\(weekend) is a regular workday."
    case weekday5, weekday6, weekday7:
        return "Wuhuuuu, it's \(weekend)!!!!!"
    default: return "Is today Twos-day. I'm drunk."
    }
}

let weekdayName1 = getWeekdayName(weekday: weekday1)
let weekdayName2 = getWeekdayName(weekday: weekday2)
let weekdayName3 = getWeekdayName(weekday: weekday3)
let weekdayName4 = getWeekdayName(weekday: weekday4)
let weekdayName5 = getWeekdayName(weekday: weekday5)
let weekdayName6 = getWeekdayName(weekday: weekday6)
let weekdayName7 = getWeekdayName(weekday: weekday7)


/* enum Weekday {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

let weekday1 = Weekday.Monday
let weekday2 = Weekday.Tuesday
let weekday3 = Weekday.Wednesday
let weekday4 = Weekday.Thursday
let weekday5 = Weekday.Friday
let weekday6 = Weekday.Saturday
let weekday7 = Weekday.Sunday

func getWeekdayName(weekday: Weekday) -> String {
    var weekdayName: String
    switch weekday {
    case .Monday: weekdayName = "Monday"
    case .Tuesday: weekdayName = "Tuesday"
    case .Wednesday: weekdayName = "Wednesday"
    case .Thursday: weekdayName = "Thursday"
    case .Friday: weekdayName = "Friday"
    case .Saturday: weekdayName = "Saturday"
    case .Sunday: weekdayName = "Sunday"
    }
    return "This weekday is called \(weekdayName)."
}

func isItFinallyWeekend(weekday: Weekday) -> String {
    if weekday == weekday5, weekday6, weekday7 {
        return "\(weekday) is a regular workday."
    } else {
        return "Wuhuuuu, it's \(weekday)."
    }
}*/

