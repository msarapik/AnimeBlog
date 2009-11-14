require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommentObserver do
  before(:each) do
    @comment = new_comment
    @comment_observer = CommentObserver.instance
  end

  it 'should call deliver_comment_notifier on comment creation' do
    Notifier.should_receive(:deliver_comment_notifier).with(@comment).once
    @comment_observer.after_save(@comment)
  end
end
