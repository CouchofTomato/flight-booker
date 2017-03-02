class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email(booking, passengers, flight)
    @booking = booking
    @passengers = passengers
    @flight = flight
    mail(to: @booking.email, subject: 'Your booking information')
  end
end
