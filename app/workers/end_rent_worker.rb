require 'sidekiq-scheduler'

class EndRentWorker
  include Sidekiq::Worker

  def perform
    puts 'Hello world'
    byebug
    RentMailer.new_rent_notification(1).deliver_later
  end
end
