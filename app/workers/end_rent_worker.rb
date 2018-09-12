require 'sidekiq-scheduler'

class EndRentWorker
  include Sidekiq::Worker

  def perform
    rents = Rent.where(end_date: Time.zone.tomorrow)
    rents.each do |rent|
        RentMailer.end_rent_notification(rent.id).deliver_later
    end
  end
end
