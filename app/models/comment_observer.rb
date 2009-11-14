class CommentObserver < ActiveRecord::Observer
  observe Comment

  def after_save(comment)
    Notifications.deliver_comment("martin@urgas.eu", "New comment was posted", comment)
  end
