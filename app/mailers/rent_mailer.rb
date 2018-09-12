# frozen_string_literal: true

class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.new_rent_notification.subject
  #
  def new_rent_notification(rent_id)
    @rent = Rent.find(rent_id)
    I18n.with_locale(@rent.user.locale) do
      mail(
        to: @rent.user.email,
        subject: t('.subject')
      )
    end
  end

  def end_rent_notification(rent_id)
    @rent = Rent.find(rent_id)
    I18n.with_locale(@rent.user.locale) do
      mail(
        to: @rent.user.email,
        subject: t('.subject')
      )
    end
  end
end
