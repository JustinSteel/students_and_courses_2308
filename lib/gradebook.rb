class GradeBook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
    @strugle_students =[]
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    all_students = {}
    @courses.each do |course|
      all_students[course.name] = course.students
    end
    all_students
  end

  def students_below(threashold)
    if student.grade < 70
      @strugle_students << student
    else nil
    end
  end
end