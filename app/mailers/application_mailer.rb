# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "from@#{Rails.application.secrets.mailer_domain}"
  layout 'mailer'
end
