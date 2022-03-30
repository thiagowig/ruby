class NotifyScheduledEventsJob < ApplicationJob

  queue_as :default

  after_perform do |job|
    self.class.set(:wait => 1.minute).perform_later
  end

  def perform
    p "LETS GO: #{DateTime.now}"
  end


end
