require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do
  describe '#Instance' do
  it 'checks course is an instance of Course' do
    course = Course.new("Calculus", 2)
      
    expect(course).to be_instance_of Course
    end
  end

  describe '#Course start details' do
    it 'has a name' do
      course = Course.new("Calculus", 2)

      expect(course.name).to eq("Calculus")
    end

    it 'has a capacity' do
      course = Course.new("Calculus", 2)

      expect(course.capacity).to eq(2)
    end

    it 'starts with no students' do
      course = Course.new("Calculus", 2)

      expect(course.students).to eq([])
    end

    it 'is not full' do
      course = Course.new("Calculus", 2)

      expect(course.full?).to be(false)
    end
  end

  describe '#Course fill up' do
    it 'fills the course up' do
      course1 = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course1.enroll(student1)
      course1.enroll(student2)

      expect(course1.students).to eq([student1, student2])
      expect(course1.full?).to be(true)
    end
  end
end
