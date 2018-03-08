teacher1 = Teacher.create(name: "Allison McLeon", username: "Allison", email: "musicmusic@email.com", password: "@ll1", info: "I teach guitar, violin, and saxophone.")

seed_students = [
  {name: "Joanne Blues", email: "joanne@email.com"},
  {name: "Jessie Royal", email: "royalone@email.com"},
  {name: "Lianne La Havas", email: "lahavas@email.com"}
]

seed_students.each do |seedling|
  student = teacher.students.create(seedling)
  entry = student.entries.create(title: "Entry 1", content: "Something nice")
  entry.save
end
