# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create( title: 'Jerry is cool1', content: 'Jerry is amazing1', section_id: 2, rank: 1)
#Comment.create( content: 'Jerry is cool', article_id: 2)
Section.create( name: 'Jerry', slug: 'jerry', rank: 300)