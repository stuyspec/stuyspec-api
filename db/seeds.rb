# coding: utf-8
Section.create(
  [
    {
      name: 'News',
      slug: 'news',
      description: 'The news of Stuyvesant',
      rank: 6,
      is_visible: true,
    },
    {
      name: 'Opinions',
      slug: 'opinions',
      description: 'The opinions of Stuyvesant',
      rank: 5,
      is_visible: true,
    },
    {
      name: 'Features',
      slug: 'features',
      description: 'The features of Stuyvesant',
      rank: 4,
      is_visible: true,
    },
    {
      name: 'Arts & Entertainment',
      slug: 'ae',
      description: 'The A&E of Stuyvesant',
      rank: 3,
      is_visible: true,
    },
    {
      name: 'Humor',
      slug: 'humor',
      description: 'The humor of Stuyvesant',
      rank: 2,
      is_visible: true,
    },
    {
      name: 'Sports',
      slug: 'sports',
      description: 'The sports of Stuyvesant',
      rank: 1,
      is_visible: true,
    },
    {
      name: '10/31 Terror Attack',
      slug: '10-31-terror-attack',
      description: '10/31 Terror Attack',
      rank: 1,
      is_visible: true,
    },
    # {
    #   name: 'Art',
    #   slug: 'art',
    #   description: 'The art of Stuyvesant',
    #   rank: 1
    # },
    # {
    #   name: 'Photo',
    #   slug: 'photo',
    #   description: 'The photo of Stuyvesant',
    #   rank: 1
    # },
    {
      name: 'Campaign Coverage',
      slug:'campaign-coverage',
      description:'The campaign of Stuyvesant',
      parent_id: 1,
      is_visible: true
    },
    {
      name: 'Staff Editorials',
      slug:'staff-editorials',
      description: 'The staff-ed of Stuyvesant',
      parent_id: 2,
      is_visible: true
    },
    {
      name: 'VOICES',
      slug: 'voices',
      description: 'The voices of Stuyvesant',
      parent_id: 3,
      is_visible: true
    },
    {
      name: '9/11',
      slug: '9-11',
      description: 'The 9/11 features of Stuyvesant',
      parent_id: 3,
      is_visible: true
    },
    {
      name: 'Creative Responses',
      slug: 'creative-responses',
      description: 'The creative responses of Stuyvesant',
      parent_id: 3,
      is_visible: true
    },
    {
      name: 'College Essays',
      slug: 'college essays',
      description: 'The college essays of Stuyvesant',
      parent_id: 3,
      is_visible: true
    },
    { name: 'Film',
      slug: 'film',
      description: 'The film of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    { name: 'Food',
      slug: 'food',
      description: 'The food of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'Literature',
      slug: 'literature',
      description: 'The literature of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'Music',
      slug: 'music',
      description: 'The music of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'Television',
      slug: 'television',
      description: 'The television of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'Theater',
      slug: 'theater',
      description: 'The theater pieces of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'Thinkpiece',
      slug: 'thinkpiece',
      description: 'The thinkpiece of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'SING!',
      slug: 'sing',
      description: 'The sing of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'STC',
      slug: 'stc',
      description: 'The stc of Stuyvesant',
      parent_id: 4,
      is_visible: true
    },
    {
      name: 'Disrespectator',
      slug: 'disrespectator',
      description: 'The disrespectator of Stuyvesant',
      parent_id: 5,
      is_visible: true
    },
    {
      name: 'Spooktator',
      slug: 'spooktator',
      description: 'The spooktator of Stuyvesant',
      parent_id: 5,
      is_visible: true
    },
    {
      name: 'Sports At Stuyvesant',
      slug: 'sports-at-stuyvesant',
      description: 'The sports at Stuyvesant',
      parent_id: 6,
      is_visible: true
    },
    {
      name: 'Professional Sports',
      slug: 'professional-sports',
      description: 'Professional sports',
      parent_id: 6,
      is_visible: true
    },
  ]
)

roles = Role.create(
  [
    {title: 'Contributor', slug:'contributors'},
    {title: 'Illustrator', slug:'illustrators'},
    {title: 'Photographer', slug: 'photographers'}
  ]
)

editorial_board = User.create({
  first_name: 'The Editorial Board',
  last_name: '',
  slug: 'the-editorial-board',
  email: 'anneandmatteo@gmail.com',
  password: 'we are the editorial board',
  password_confirmation: 'we are the editorial board',
  description: 'The Editorial Board'
})
Profile.create(role_id: 1, user_id: editorial_board.id)

u = User.create({
  first_name: 'Victor',
  last_name: 'Siu',
  email: 'vsiu10@stuy.edu',
  password: 'testlocal',
  description: 'This account exists so I can test locally',
  security_level: 2
})
u.confirm
u.update(security_level:2)

Section.find_each do |section|
  if section.parent_id == nil
    user = User.create({
      first_name: 'The ' + section.name + ' Department',
      last_name: '',
      slug: 'the-' + section.slug + '-department',
      email: section.slug + '@stuyspec.com',
      password: section.description,
      password_confirmation: section.description,
      description: 'The ' + section.name + ' Department'
    })    
    Profile.create(role_id: 1, user_id: user.id)
  end
end

unless ENV['minimal']
  Section.find_each.with_index do |section, index|
    Article.create([
                     {
                       title: section.name + ' Database Article With Index ' + index.to_s,
                       summary: 'Unfortunately, all good things must come to an end'\
                                '. We came into Stuyvesant last September, saved'\
                                'from the unstructured summer.',
                       section_id: section.id,
                       rank: 1,
                       slug: section.slug + '-database-article-with-index-' + index.to_s,
                       volume: 108,
                       issue: 1,
                       is_published: true,
                       content: '<p>StuyHacks held its fourth hackathon, StuyHacks'\
                                'IV, on Saturday, May 27, and Sunday, May 28. The'\
                                ' event provided an opportunity for 175 high-school'\
                                'students from the U.S. and Canada to learn about '\
                                'and to immerse themselves in computer science.'\
                                '</p><p>A hackathon is an event where programmers'\
                                ' can collaborate on a range of computer science '\
                                'projects. The hackathon organizers secured the '\
                                'sponsorship of a number of technology companies,'\
                                'including Facebook, MakeSchool, RedSeal, and '\
                                'ThoughtWorks, to subsidize the event. The event'\
                                'was held in the Midtown office of ThoughtWorks.'\
                                '</p><p>StuyHacks worked together with the computer'\
                                'science department and the Dojo, which is an '\
                                'afterschool community for computer science '\
                                'enthusiasts, to recruit mentors to help teach at'\
                                'the hackathon. “Mentors [were] generally college'\
                                'students who are majoring in Computer Science or '\
                                'Computer Engineering. Some mentors [were] also '\
                                'students from Stuyvesant who are currently taking'\
                                'post-AP level courses,” senior and StuyHacks '\
                                'logistics director Prancing Goose said.</p><p>'\
                                'During the hackathon, attendees were organized '\
                                'into groups of two to four for a team-building '\
                                'session. These teams competed against one another'\
                                'as they worked on a variety of programming '\
                                'projects, from developing a mobile app to building '\
                                'robot.</p><p>Alongside the competitions, multiple'\
                                'workshops were held throughout the event to teach'\
                                'attendees different computer science skills and '\
                                'languages. For example, junior Shakil Rafi led the '\
                                'Android Development workshop, which taught '\
                                'participants how to code apps for the Android '\
                                'operating system. </p><p>At the end of StuyHacks IV'\
                                ', a panel of judges evaluated the group projects'\
                                'and gave out multiple awards based off of them.'\
                                'Seniors Nicholas Ng, Anya Keller, Mikhail Kotlik,'\
                                'and Daniel Monteagudo came in third place for the'\
                                'best overall project award for their work on Politalk,'\
                                'a website inspired by the 2016 election that connects'\
                                'people with opposing political ideologies through '\
                                'a chat app.</p><p>For future hackathons, StuyHacks'\
                                'organizers hope to increase funding to expand the'\
                                'event by reserving a larger venue and adding more'\
                                'workshops. Despite this, StuyHacks IV was well '\
                                'received by many of its attendees. “Having been to'\
                                'past StuyHacks, it is amazing to see all the '\
                                'improvements done over the years to benefit '\
                                'programmers,” senior Kevin Zhang said.</p>'
                     },
                     {
                       title: section.name + ' Database Article With Index ' + index.to_s + ' Numero Dos',
                       summary: 'Unfortunately, all good things must come to an end'\
                                '. We came into Stuyvesant last September, saved'\
                                'from the unstructured summer.',
                       section_id: section.id,
                       rank: 1,
                       slug: section.slug + '-database-article-with-index-' + index.to_s + '-numero-dos',
                       volume: 108,
                       issue: 1,
                       is_published: true,
                       content: '<p>StuyHacks held its fourth hackathon, StuyHacks'\
                                'IV, on Saturday, May 27, and Sunday, May 28. The'\
                                ' event provided an opportunity for 175 high-school'\
                                'students from the U.S. and Canada to learn about '\
                                'and to immerse themselves in computer science.'\
                                '</p><p>A hackathon is an event where programmers'\
                                ' can collaborate on a range of computer science '\
                                'projects. The hackathon organizers secured the '\
                                'sponsorship of a number of technology companies,'\
                                'including Facebook, MakeSchool, RedSeal, and '\
                                'ThoughtWorks, to subsidize the event. The event'\
                                'was held in the Midtown office of ThoughtWorks.'\
                                '</p><p>StuyHacks worked together with the computer'\
                                'science department and the Dojo, which is an '\
                                'afterschool community for computer science '\
                                'enthusiasts, to recruit mentors to help teach at'\
                                'the hackathon. “Mentors [were] generally college'\
                                'students who are majoring in Computer Science or '\
                                'Computer Engineering. Some mentors [were] also '\
                                'students from Stuyvesant who are currently taking'\
                                'post-AP level courses,” senior and StuyHacks '\
                                'logistics director Prancing Goose said.</p><p>'\
                                'During the hackathon, attendees were organized '\
                                'into groups of two to four for a team-building '\
                                'session. These teams competed against one another'\
                                'as they worked on a variety of programming '\
                                'projects, from developing a mobile app to building '\
                                'robot.</p><p>Alongside the competitions, multiple'\
                                'workshops were held throughout the event to teach'\
                                'attendees different computer science skills and '\
                                'languages. For example, junior Shakil Rafi led the '\
                                'Android Development workshop, which taught '\
                                'participants how to code apps for the Android '\
                                'operating system. </p><p>At the end of StuyHacks IV'\
                                ', a panel of judges evaluated the group projects'\
                                'and gave out multiple awards based off of them.'\
                                'Seniors Nicholas Ng, Anya Keller, Mikhail Kotlik,'\
                                'and Daniel Monteagudo came in third place for the'\
                                'best overall project award for their work on Politalk,'\
                                'a website inspired by the 2016 election that connects'\
                                'people with opposing political ideologies through '\
                                'a chat app.</p><p>For future hackathons, StuyHacks'\
                                'organizers hope to increase funding to expand the'\
                                'event by reserving a larger venue and adding more'\
                                'workshops. Despite this, StuyHacks IV was well '\
                                'received by many of its attendees. “Having been to'\
                                'past StuyHacks, it is amazing to see all the '\
                                'improvements done over the years to benefit '\
                                'programmers,” senior Kevin Zhang said.</p>'
                     },
                     {
                       title: section.name + ' Database Article With Index ' + index.to_s + ' Numero Tres',
                      summary: 'Unfortunately, all good things must come to an end.'\
                               'We came into Stuyvesant last September, saved from'\
                               'the unstructured summer.',
                      section_id: section.id,
                      rank: 1,
                      slug: section.slug + '-database-article-with-index-' + index.to_s + '-numero-tres',
                      volume: 108,
                      issue: 1,
                      is_published: true,
                      content: '<p>StuyHacks held its fourth hackathon, StuyHacks'\
                                'IV, on Saturday, May 27, and Sunday, May 28. The'\
                                ' event provided an opportunity for 175 high-school'\
                                'students from the U.S. and Canada to learn about '\
                                'and to immerse themselves in computer science.'\
                                '</p><p>A hackathon is an event where programmers'\
                                ' can collaborate on a range of computer science '\
                                'projects. The hackathon organizers secured the '\
                                'sponsorship of a number of technology companies,'\
                                'including Facebook, MakeSchool, RedSeal, and '\
                                'ThoughtWorks, to subsidize the event. The event'\
                                'was held in the Midtown office of ThoughtWorks.'\
                                '</p><p>StuyHacks worked together with the computer'\
                                'science department and the Dojo, which is an '\
                                'afterschool community for computer science '\
                                'enthusiasts, to recruit mentors to help teach at'\
                                'the hackathon. “Mentors [were] generally college'\
                                'students who are majoring in Computer Science or '\
                                'Computer Engineering. Some mentors [were] also '\
                                'students from Stuyvesant who are currently taking'\
                                'post-AP level courses,” senior and StuyHacks '\
                                'logistics director Prancing Goose said.</p><p>'\
                                'During the hackathon, attendees were organized '\
                                'into groups of two to four for a team-building '\
                                'session. These teams competed against one another'\
                                'as they worked on a variety of programming '\
                                'projects, from developing a mobile app to building '\
                                'robot.</p><p>Alongside the competitions, multiple'\
                                'workshops were held throughout the event to teach'\
                                'attendees different computer science skills and '\
                                'languages. For example, junior Shakil Rafi led the '\
                                'Android Development workshop, which taught '\
                                'participants how to code apps for the Android '\
                                'operating system. </p><p>At the end of StuyHacks IV'\
                                ', a panel of judges evaluated the group projects'\
                                'and gave out multiple awards based off of them.'\
                                'Seniors Nicholas Ng, Anya Keller, Mikhail Kotlik,'\
                                'and Daniel Monteagudo came in third place for the'\
                                'best overall project award for their work on Politalk,'\
                                'a website inspired by the 2016 election that connects'\
                                'people with opposing political ideologies through '\
                                'a chat app.</p><p>For future hackathons, StuyHacks'\
                                'organizers hope to increase funding to expand the'\
                                'event by reserving a larger venue and adding more'\
                                'workshops. Despite this, StuyHacks IV was well '\
                                'received by many of its attendees. “Having been to'\
                                'past StuyHacks, it is amazing to see all the '\
                                'improvements done over the years to benefit '\
                                'programmers,” senior Kevin Zhang said.</p>'
                     },
                     {
                       title: section.name + ' Database Article With Index ' + index.to_s + ' Numero Cuatro',
                      summary: 'Unfortunately, all good things must come to an end.'\
                               'We came into Stuyvesant last September, saved from'\
                               'the unstructured summer.',
                      section_id: section.id,
                      rank: 1,
                      slug: section.slug + '-database-article-with-index-' + index.to_s + '-numero-cuatro',
                      volume: 108,
                      issue: 1,
                      is_published: true,
                      content: '<p>StuyHacks held its fourth hackathon, StuyHacks'\
                                'IV, on Saturday, May 27, and Sunday, May 28. The'\
                                ' event provided an opportunity for 175 high-school'\
                                'students from the U.S. and Canada to learn about '\
                                'and to immerse themselves in computer science.'\
                                '</p><p>A hackathon is an event where programmers'\
                                ' can collaborate on a range of computer science '\
                                'projects. The hackathon organizers secured the '\
                                'sponsorship of a number of technology companies,'\
                                'including Facebook, MakeSchool, RedSeal, and '\
                                'ThoughtWorks, to subsidize the event. The event'\
                                'was held in the Midtown office of ThoughtWorks.'\
                                '</p><p>StuyHacks worked together with the computer'\
                                'science department and the Dojo, which is an '\
                                'afterschool community for computer science '\
                                'enthusiasts, to recruit mentors to help teach at'\
                                'the hackathon. “Mentors [were] generally college'\
                                'students who are majoring in Computer Science or '\
                                'Computer Engineering. Some mentors [were] also '\
                                'students from Stuyvesant who are currently taking'\
                                'post-AP level courses,” senior and StuyHacks '\
                                'logistics director Prancing Goose said.</p><p>'\
                                'During the hackathon, attendees were organized '\
                                'into groups of two to four for a team-building '\
                                'session. These teams competed against one another'\
                                'as they worked on a variety of programming '\
                                'projects, from developing a mobile app to building '\
                                'robot.</p><p>Alongside the competitions, multiple'\
                                'workshops were held throughout the event to teach'\
                                'attendees different computer science skills and '\
                                'languages. For example, junior Shakil Rafi led the '\
                                'Android Development workshop, which taught '\
                                'participants how to code apps for the Android '\
                                'operating system. </p><p>At the end of StuyHacks IV'\
                                ', a panel of judges evaluated the group projects'\
                                'and gave out multiple awards based off of them.'\
                                'Seniors Nicholas Ng, Anya Keller, Mikhail Kotlik,'\
                                'and Daniel Monteagudo came in third place for the'\
                                'best overall project award for their work on Politalk,'\
                                'a website inspired by the 2016 election that connects'\
                                'people with opposing political ideologies through '\
                                'a chat app.</p><p>For future hackathons, StuyHacks'\
                                'organizers hope to increase funding to expand the'\
                                'event by reserving a larger venue and adding more'\
                                'workshops. Despite this, StuyHacks IV was well '\
                                'received by many of its attendees. “Having been to'\
                                'past StuyHacks, it is amazing to see all the '\
                                'improvements done over the years to benefit '\
                                'programmers,” senior Kevin Zhang said.</p>'
                     }
                   ]
                  )
  end

  users = User.create(
    [
      {
        first_name: 'John',
        last_name: 'DoeOne',
        slug: 'john-doeone',
        email: 'john1@gmail.com',
        password: 'topsecret1',
        password_confirmation: 'topsecret1',
        description: 'number one'
      },
      {
        first_name: 'John',
        last_name: 'DoeTwo',
        slug: 'john-doetwo',
        email: 'john2@gmail.com',
        password: 'topsecret2',
        password_confirmation: 'topsecret2',
        description: 'number two'
      },
      {
        first_name: 'John',
        last_name: 'DoeThree',
        slug: 'john-doethree',
        email: 'john3@gmail.com',
        password: 'topsecret3',
        password_confirmation: 'topsecret3',
        description: 'number three'
      },
      {
        first_name: 'John',
        last_name: 'DoeFour',
        slug: 'john-doefour',
        email: 'john4@gmail.com',
        password: 'topsecret4',
        password_confirmation: 'topsecret4',
        description: 'number four'
      },
      {
        first_name: 'John',
        last_name: 'DoeFive',
        slug: 'john-doefive',
        email: 'john5@gmail.com',
        password: 'topsecret5',
        password_confirmation: 'topsecret5',
        description: 'number five'
      },
      {
        first_name: 'John',
        last_name: 'DoeSix',
        slug: 'john-doesix',
        email: 'john6@gmail.com',
        password: 'topsecret6',
        password_confirmation: 'topsecret6',
        description: 'number six'
      },
    ]
  )

  Article.find_each do |article|
    Authorship.create(user_id: users.sample.id, article_id: article.id)
    #Outquote.create(article_id: article.id, text: 'Example outquote affecting the lives of many readers.')
    #Comment.create(user_id: users.sample.id, article_id: article.id, content: 'I loved this article! (unpublished comment)')
    #c = Comment.new(user_id: users.sample.id, article_id: article.id, content: 'I loved this article! (published comment)')
    #c.save!
    #c.publish
  end

  User.find_each do |user|
    Role.find_each do |role|
      unless user.last_name == '' and role.title == 'Contributor'# departments are already contributors
        Profile.create(role_id: role.id, user_id: user.id)
      end
    end
  end

  if ENV['media']
    Section.where(parent_id: nil).find_each do |section|
      Article.where(section_id: section.id)[0, 3].each do |article|
        article.media.create(
          profile_id: Profile.joins(:role).where("roles.title = ?", "Photographer").order("RANDOM()").first.id,
          title: 'A sample photo for ' + article.title,
          media_type: 'photo', 
          is_featured: true, 
          attachment: File.open(Rails.root + 'db/sample_photo.jpg')
        )
      end
    end
  end
end
