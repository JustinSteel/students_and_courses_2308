require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe GradeBook do
  describe '#Instructor' do
    it 'has an instructor' do
      gradebook = GradeBook.new("Jimbo")

      expect(gradebook.instructor).to eq("Jimbo")
    end
  end

  describe '#courses' do
    it 'starts with no courses' do
      gradebook = GradeBook.new("Jimbo")

      expect(gradebook.courses).to eq([])
    end

    it 'adds a course' do
      gradebook = GradeBook.new("Jimbo")
      course1 = Course.new("History", 2)
      gradebook.add_course(course1)

      expect(gradebook.courses).to eq([course1])
    end

    it 'lists all students' do
      gradebook = GradeBook.new("Jimbo")
      course1 = Course.new("History", 2)
      course2 = Course.new("English", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student1)

      expect(gradebook.list_all_students).to eq({History: [student1,student2], English: [student1]})
    end

    it 'shows struggeling students' do
      gradebook = GradeBook.new("Jimbo")
      course1 = Course.new("History", 2)
      course2 = Course.new("English", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student1)
      student1.log_score(50)

      expect(gradebook.students_below(70)). to eq([student1])
    end
  end
end