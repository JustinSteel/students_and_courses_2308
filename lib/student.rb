class Student
  attr_reader :name, :age, :scores

  def initialize(student_atributes)
    @name = student_atributes[:name]
    @age = student_atributes[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    (@scores.sum.to_f / @scores.count.to_f)
  end
  
end
