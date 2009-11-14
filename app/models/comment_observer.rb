class CommentObserver < ActiveRecord::Observer
  def after_save(comment)
    Notifier.deliver_comment_notifier(comment)
  end
end
