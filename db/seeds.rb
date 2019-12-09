# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i| 
    Blog.create!(
        title: "My Blog Post #{i}",
        body: "Lorem ipsum dolor sit amet, ...."
    )
end

puts "Blog posts created"

5.times do |i| 
    Skill.create!(
        title: "Rails #{i}",
        utilized: 15
    )
end

puts "Skills created"

5.times do |i| 
    Portfolio.create!(
        title: "Porfolio Title #{i}",
        subtitle: "Porfolio Subtitle #{i}", 
        body: "Lorem Ipsum Body Text #{i}",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    )
end

puts "Portfolio items created"