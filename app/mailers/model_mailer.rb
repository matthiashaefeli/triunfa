class ModelMailer < ApplicationMailer

require 'sendgrid-ruby'
include SendGrid

  default from: "plataforma.superateytriunfa@gmail.com"

  def new_record_notification(user, group)
    from = Email.new(email: 'plataforma.superateytriunfa@gmail.com')
    to = Email.new(email: user.email)
    subject = 'Bienvenido'
    content = Content.new(type: 'text/plain', value: "Bienvenido a Superate y triunfa.Tu grupo es: #{group.name} y tu instructor es: #{group.teacher.user.name} #{group.teacher.user.lastname}")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
