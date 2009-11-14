require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Notifier do
  before(:each) do
    @comment = new_comment
  end

  it 'should send an e-mail and check its template on comment creation' do
    lambda {
      Notifier.deliver_comment_notifier(@comment)
    }.should change(ActionMailer::Base.deliveries, :size)

    mail = ActionMailer::Base.deliveries.last
    mail.body.should match(/#{@comment.article.title}/)
    mail.body.should match(/#{@comment.author}/)
    mail.body.should match(/#{@comment.content}/)
  end
end
