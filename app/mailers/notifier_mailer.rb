class NotifierMailer < ApplicationMailer
  def alert_admin(employee)
    @name = employee.name
    @id = employee.id
    mail(:to=>"kumarashish79924@gmail.com",:subject=>"ALERT- A employee is added!")
  end
end
