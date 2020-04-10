Instructor.create_with(email: "instructor@#{SecureRandom.hex(2)}.com").find_or_create_by(name: 'Instructor #1')
User.create_with(email: "user@#{SecureRandom.hex(2)}.com").find_or_create_by(name: 'User #1')

puts '***** Seeds completed'
