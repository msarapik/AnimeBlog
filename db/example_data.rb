module FixtureReplacement
  attributes_for :article do |a|
    a.title    = random_string(30)
    a.content  = random_string(150)
    a.author   = 'John Doe'
    a.category = new_category
  end
  
  attributes_for :comment do |c|
    c.author  = 'John Doe'
    c.content = random_string(50)
    c.article = new_article
  end

  attributes_for :category do |c|
    c.name = random_string(20)
  end
end
