class Notifier < ActionMailer::Base
  def comment_notifier(comment)  
    recipients AppConfig[:receiver]['address']
    from       AppConfig[:sender]['address']
    subject    'A new comment has been added!'
    body       :article => comment.article.title, :author => comment.author, :content => comment.content
  end
end
