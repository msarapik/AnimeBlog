class Notifier < ActionMailer::Base
  def comment_notifier(comment)  
    recipients 'martin@gmail.com'
    from       'no-reply@martinsanimeblog.com'
    subject    'A new comment has been added!'
    body       :article => comment.article.title, :author => comment.author, :content => comment.content
  end
end
