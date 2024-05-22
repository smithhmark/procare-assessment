# frozen_string_literal: true
require '/app/app/consumers/application_consumer'
# Example consumer that consumes the events topic and stores data into events table
class VisitsConsumer < ApplicationConsumer
  # Consumes the messages by inserting all of them in one go into the DB
  def consume
    ::Visit.insert_all messages.payloads
  end
end
