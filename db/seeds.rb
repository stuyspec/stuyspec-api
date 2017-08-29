# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating sections"
Section.create( name: 'News', slug: 'news', description:'News is a great department!')
Section.create( name: 'Opinions', slug: 'opinions', description: 'Opinions is a great department!')
Section.create( name: 'Features', slug: 'features', description: 'Features is a great department!')
Section.create( name: 'Sports', slug: 'sports', description: 'Sports is a great department!')
Section.create( name: 'Arts and Entertainment', slug: 'ae', description: 'Arts and Entertainment is a great department!')
Section.create( name: 'Humor', slug: 'humor', description: 'Humor is a great department!')
puts "Finished creating sections"

puts "Creating Articles"
Article.create( title: 'The Rooftop Garden: What Does Urban Growth Really Mean?', content: '<p>Through the balcony doors in the woodshop class on the 10th floor lies the rooftop garden. A small, bright space with quaint wooden crates and a mishmash of colorful planting supplies, Stuyvesant’s rooftop garden delivers fresh veggies and a dose of relaxation that is inevitable when sunshine, plants, and a gorgeous view are involved.</p>
<p>When I went up to the rooftop garden, I was struck by what a welcome change the airy, carefree space was from the stress of Stuyvesant. Guided by biology teacher Marissa Maggio, my friends and I helped water the recently sprouted herbs and vegetables, soaking them with the long hose that we tugged around the garden and learning firsthand the importance of the rooftop garden in our urban landscape. </p>
<p>The rooftop garden was created by the Environmental Club, inspired by Battery Urban Farm, an education farm in Battery Park that aims to teach students about sustainable farming and get them involved in growing their own food. The rooftop garden was created to expand those values to Stuyvesant by using the space available in our school to compensate for the limited room on the Battery Urban Farm plot.</p>
<p>Though the rooftop garden has been around for awhile, explored by different clubs and different grades, this year, the Environmental Club focused on revamping the garden. Maggio reached out to senior Livia Kunins-Berkowitz, who had spent her spring semester of junior year living and working at the Mountain School, a farm-school in Vermont. </p>
<p>Kunins-Berkowitz, guided by her passion for gardening and agriculture, threw herself into the project. “I’m really into environmentalism, and as a city person, we’re so removed from food production,” she said. “If we’re going to be sustainable, we need to learn how to grow in urban spaces because our country is so urban now. I want there to be opportunities for kids get involved and find a passion and learn about something they would never have the opportunity to learn otherwise.”</p>
<p>Careful planning gave way to two planting sessions, with students eager to get involved. “I’m excited by how many people are interested in [the rooftop garden] and like different friend groups and all that kind of stuff.  It always makes me really happy when different people come together,” Kunins-Berkowitz said.</p>
<p>Now, as the plants are growing, Maggio contacts Kunins-Berkowitz with her free periods, and members sign up to water during those periods on the rooftop garden’s Facebook page and show up when they can. “It’s this nice, casual thing,” Kunins-Berkowitz said.</p>
<p>Club members were drawn to the rooftop garden because of the unique chance they get to practice gardening. “You can live in the city, and yet, you can do all these things that are garden-y and leisurely,” sophomore Sophia Atlas said. </p>
<p>Being on the roof is also a big selling point. “I mostly wanted to see what the roof looked like,” sophomore Louise Wagenseil admitted with a laugh. Her interest, though, stems from prior school efforts to help the environment. “[In elementary school], we actually grew our own vegetables for the cafeteria, and they were actually good vegetables, so I was kind of interested to see how Stuy[vesant] would do the same thing.” </p>
<p>It’s a lot of fun for members, plainly visible in the stories members recall with a laugh. “At one point, someone was holding the hose, and the hose has to go all the way from the wall of the woodworking room all the way outside, and the hose wasn’t really that long, and so a bunch of people were pulling the hose, and it exploded,” Wagenseil reminisced.</p>
<p>Whether students realize it or not, the rooftop garden has a heavy impact on all Stuyvesant students—it’s their lunch. Food harvested from the rooftop garden goes back into the salad bar in the cafeteria. </p>
<p>On a wider level, rooftop gardens not only provide fresh food, but they also improve air quality and lower increased temperatures in urban areas, known as urban heat island effect control. “The sustainable future of America is in learning how to grow in urban spaces,” Kunins-Benowitz said.</p>
<p>A huge chunk of America’s failing relationship with the environment is waste-related, and the hard work put into the garden helps members gain a deeper perception of this issue. The Guardian estimated roughly 50 percent of all produce in the United States is thrown away; this happens because it’s so easy for us to get everything that we take the availability of produce for granted. </p>
<p>By making the rooftop garden environment so personal, it offers a solution to this problem. “When you spend months taking care of this garden, you don’t wanna be throwing that out,” sophomore Secretary of the Environmental Club Kenny Wong said. </p>
Along with the tomatoes and kale, the rooftop garden delivers an empowering sense of independence and awareness. “We have so little power over what we eat, especially as kids, and it’s so cool to take control of your life in this way,” Kunins-Berkowitz said. </p>
<p>As New Yorkers and students, we are isolated from the origins and processes that go into the food we mindlessly consume, most of our knowledge coming from the inspiring stories on the back of cereal boxes. The rooftop garden is a rare opportunity to learn, and it is one that should be seized.</p>
', slug: 'The-Rooftop-Garden-What-Does-Urban-Growth-Really-Mean', volume: '1', issue:'1',is_published: true, section_id: 3)

Article.create( title: 'Uncontested; Unelected?', content: '<p>An unopposed candidacy might signify incredible popularity, and a margin of victory of 100 percent. It could also signify a lack of opposition, and of civic engagement. In the worst case, the election may be coerced. James Monroe was elected President of the United States by a margin of 228-1 in 1820; Kim Jong-un was elected President of North Korea by a margin of 687-0 in 2014. From overwhelming approval to coercion, the most recent Student Union (SU) elections fall somewhere in between.</p>
<p>Bitter liberals like to whine about the low democratic turnout in America’s presidential election, but Stuyvesant is much worse, routinely seeing only a minority of the student body vote. This year, the SU and Senior Caucus elections stooped to a new level of apathy, each featuring a single candidacy. Junior Kevin Boodram, who ran for caucus three times in the past, said, “ I don’t think people understand what the Student Union does. I think that discourages a lot people from running in the first place, even voting.” His older brother’s friends told him the SU was only good for planning parties.</p>
<p>Yet the SU organizes perhaps the biggest display of school spirit each year, SING!. The SU’s impressive budget of over $100,000 is what makes clubs and publications possible. And the President and Vice President routinely meet with school administration as the ones advocating for the student body. Perhaps it is time to pay more attention to election season.</p>
<p>If presented with the opportunity to cast a ballot, I surely would have voted for Tahseen Chowdhury and Alexa Valentino for Student Union President and Vice President, as well as for Pallab Saha and Abie Rohrig for Senior Caucus; the problem, however, is that not a single ballot was cast. With the student body’s interests at stake, it is dangerous to have an uncontested—and therefore unelected—official in power (see North Korea).</p>
<p>A more troubling trend, however, seems to be damaging SU elections: the toxic environment surrounding challenges to the incumbent. Most recently, sophomore Abner Kahan faced personal attacks over Facebook for trying to run for positions in the Student Union. “Most people laughed at me and didn’t take me seriously. Some were even slightly hostile,” Kahan said. </p>
<p>Hostility directly discourages students from running. It is hard enough to break into the SU—incumbents have the advantage of knowing the organization’s inner-workings, evidenced by a six-year chain of SU Vice Presidents becoming President. Bullying is not only degrading, but makes the task impossible; Kahan gave up on running for Student Union, and eventually pulled out of the Junior Caucus race—his ideas were effectively silenced.</p>
<p>Boodram added that it is very difficult for candidates to run after suffering a loss. “If you lose a campaign, and you try to do anything after that, people are always going to flame you and say you’re salty or whatever and criticize you for trying to run again,” he said, nodding vigorously when asked if he was bullied. Stuyvesant students are quick to transgress the boundary from debating policies to personal attacks.</p>
<p>SU elections have always been meaningful; now it is time for the student body to treat them professionally. Innovation and competition are crucial to testing ideas and ensuring our Student Union provides us with the best experience they can, but this is only possible if we are open to new ideas and have the confidence that, when we choose to speak out, others will respect our voices.</p>
', slug: 'Uncontested-Unelected', volume: '1', issue:'1',is_published: true, section_id: 2)

Article.create( title: 'StuyHacks Hosts Its Fourth Hackathon', content: '<p>StuyHacks held its fourth hackathon, StuyHacks IV, on Saturday, May 27, and Sunday, May 28. The event provided an opportunity for 175 high-school students from the U.S. and Canada to learn about and to immerse themselves in computer science.</p>
<p>A hackathon is an event where programmers can collaborate on a range of computer science projects. The hackathon organizers secured the sponsorship of a number of technology companies, including Facebook, MakeSchool, RedSeal, and ThoughtWorks, to subsidize the event. The event was held in the Midtown office of ThoughtWorks.</p>
<p>StuyHacks worked together with the computer science department and the Dojo, which is an afterschool community for computer science enthusiasts, to recruit mentors to help teach at the hackathon. “Mentors [were] generally college students who are majoring in Computer Science or Computer Engineering. Some mentors [were] also students from Stuyvesant who are currently taking post-AP level courses,” senior and StuyHacks logistics director Prangon Ghose said.</p>
<p>During the hackathon, attendees were organized into groups of two to four for a team-building session. These teams competed against one another as they worked on a variety of programming projects, from developing a mobile app to building a robot.</p>
<p>Alongside the competitions, multiple workshops were held throughout the event to teach attendees different computer science skills and languages. For example, junior Shakil Rafi led the Android Development workshop, which taught participants how to code apps for the Android operating system. </p>
<p>At the end of StuyHacks IV, a panel of judges evaluated the group projects and gave out multiple awards based off of them. Seniors Nicholas Ng, Anya Keller, Mikhail Kotlik, and Daniel Monteagudo came in third place for the best overall project award for their work on Politalk, a website inspired by the 2016 election that connects people with opposing political ideologies through a chat app.</p>
<p>For future hackathons, StuyHacks organizers hope to increase funding to expand the event by reserving a larger venue and adding more workshops. Despite this, StuyHacks IV was well received by many of its attendees. “Having been to past StuyHacks, it is amazing to see all the improvements done over the years to benefit programmers,” senior Kevin Zhang said.</p>
', slug: 'StuyHacks-Hosts-Its-Fourth-Hackathon', volume: '1', issue:'1',is_published: true, section_id:1)

Article.create( title: 'Student Wins Best Paper Award at CNERT Workshop', content:'<p>Junior Caleb Smith-Salzberg won the Best Paper Award for his entry, “Bridging the Digital Divide Between Research and Home Networks,” at the IEEE International Conference on Computer Communications (INFOCOM) in Atlanta on May 1. He had previously presented his paper on April 21 at the New York University (NYU) Research Expo held at the Tandon School of Engineering. </p>
<p>Smith-Salzberg’s project aims to narrow the gap between the top-notch internet connections that researchers usually have with the much poorer quality connections that average Americans have. “I created a tool that makes it easy for researchers to exactly mimic the internet speeds and connections of an actual U.S. household that is sampled from a dataset of over 10 thousand households,” Smith-Salzberg said in an e-mail interview. </p>
<p>Last year, Smith-Salzberg was admitted into NYU’s ARISE program, which gives high school students an opportunity to conduct search over the summer with researchers. Here, he began his project that would eventually lead to his paper. “I wanted to challenge myself with different coding problems and expand my knowledge of graphing and using libraries of code. I also wanted to work with huge amounts of data,” he said. His mentor in the program was Fraida Fund of the Center for Advanced Technology in Telecommunications lab at NYU. </p>
<p>Smith-Salzberg collaborated with Fund to finalize his research project during the summer. By the end of the program, he had programmed a successfully functioning script, and had completed his main goal. However, Smith-Salzberg and Fund continued to work extensively on the project after the program and the two worked together on Smith-Salzberg’s final paper.</p>
<p>Smith-Salzberg was able to first present his findings to field professionals and professors at the NYU Research Expo in late April. “It was extremely useful in preparation for the [IEEE INFOCOM],” he said.</p>
<p>A week later, Smith-Salzberg went to the IEEE INFOCOM conference to present his work. Out of the hundreds of participants, Smith-Salzberg competed directly against seven other presenters in his workshop, which focused on computer and networking experimental research. </p>
<p>Many of Smith-Salzberg’s competitors were graduate students and possessed more experience in the field of research. “I was very prepared for the presentation at the conference because at that point I had been pitching my project for around nine months. Making a presentation for a more professional audience was not very difficult,” he said. “I did not think I was going to win, and was super excited when it was announced.”</p>
<p>Smith-Salzberg  is eager to see people using and developing his tool. “All the code is open source, so anyone can suggest edits or built on it, “ he said. “I [learned] a great deal about the importance of reproducibility in research, and taking note of everything done.” </p>
<p>He is excited about the future of the program and encourages more students to take advantage of the computer science program at Stuyvesant. “After spending the summer with many graduate students who major or minor in computer science, I can say Stuyvesant prepares you extraordinarily well for the field,” Smith-Salzberg said.</p>
', slug: 'Student-Wins-Best-Paper-Award-at-CNERT-Workshop', volume: '2', issue:'2',is_published: true, section_id: 1)

#Medium.create( url:'http://www.stuyspec.com/wp-content/uploads/Issue-16_Features_Stuyvesant-Rooftop-Gardening-Lillian-Xiao.png', article_id: 1)
#Medium.create( url: 'http://www.stuyspec.com/wp-content/uploads/NEWS-Caleb-Smith-Salzberg-by-Tasdid-Khandaker-768x1149.jpg', article_id: 4)

puts "Creating roles"
Role.create(title: 'Contributor', slug:'contributors')
Role.create(title: 'Illustrator', slug:'illustrators')
Role.create(title: 'Photographer', slug: 'photographers')
puts "Finished creating roles"

puts "Creating users"
User.create(first_name: 'John', last_name: 'DoeOne', slug: 'john-doeone', username:'jdoe1', email: 'john1@gmail.com', password: 'topsecret1', password_confirmation: 'topsecret1', description: 'number one')
User.create(first_name: 'John', last_name: 'DoeTwo', slug: 'john-doetwo', username:'jdoe2', email: 'john2@gmail.com', password: 'topsecret2', password_confirmation: 'topsecret2', description: 'number two')
User.create(first_name: 'John', last_name: 'DoeThree', slug: 'john-doethree', username:'jdoe3', email: 'john3@gmail.com', password: 'topsecret3', password_confirmation: 'topsecret3', description: 'number three')
User.create(first_name: 'John', last_name: 'DoeFour', slug: 'john-doefour', username:'jdoe4', email: 'john4@gmail.com', password: 'topsecret4', password_confirmation: 'topsecret4', description: 'number four')
User.create(first_name: 'John', last_name: 'DoeFive', slug: 'john-doefive', username:'jdoe5', email: 'john5@gmail.com', password: 'topsecret5', password_confirmation: 'topsecret5', description: 'number five')
User.create(first_name: 'John', last_name: 'DoeSix', slug: 'john-doesix', username:'jdoe6', email: 'john6@gmail.com', password: 'topsecret6', password_confirmation: 'topsecret6', description: 'number six')
puts "Finished creating users"

puts "Creating comments"
Comment.create( content: 'This is a great article!', article_id: 1, user_id: 1)
Comment.create( content: 'This is a great article!', article_id: 2, user_id: 2)
Comment.create( content: 'This is a great article!', article_id: 3, user_id: 3)
Comment.create( content: 'This is a great article!', article_id: 4, user_id: 4)
puts "Finished creating comments"

puts "Creating Authorships"
Authorship.create( user_id:1, article_id: 1)
Authorship.create( user_id:2, article_id: 2)
Authorship.create( user_id:3, article_id: 3)
Authorship.create( user_id:4, article_id: 3)
Authorship.create( user_id:5, article_id: 4)
Authorship.create( user_id:6, article_id: 4)
puts "Finished creating authorships"

puts "Creating UserRoles"
UserRole.create( user_id: 1, role_id: 1)
UserRole.create( user_id: 2, role_id: 1)
UserRole.create( user_id: 3, role_id: 1)
UserRole.create( user_id: 4, role_id: 1)
UserRole.create( user_id: 5, role_id: 1)
UserRole.create( user_id: 6, role_id: 1)
UserRole.create( user_id: 1, role_id: 2)
UserRole.create( user_id: 2, role_id: 2)
UserRole.create( user_id: 3, role_id: 2)
UserRole.create( user_id: 4, role_id: 2)
UserRole.create( user_id: 5, role_id: 2)
UserRole.create( user_id: 6, role_id: 2)
UserRole.create( user_id: 1, role_id: 3)
UserRole.create( user_id: 2, role_id: 3)
UserRole.create( user_id: 3, role_id: 3)
UserRole.create( user_id: 4, role_id: 3)
UserRole.create( user_id: 5, role_id: 3)
UserRole.create( user_id: 6, role_id: 3)
puts "Finished creating UserRoles"