class ApplicationMailer < ActionMailer::Base
  default from: Setting[:notify_from]
  layout 'mailer'
end
