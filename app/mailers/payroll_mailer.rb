class PayrollMailer < ApplicationMailer
  default from: "payroll@bonifacehiers.com"

  def payroll_email(users, start_week, end_week, current_user)
    @users = users
    @start_week = start_week
    @end_week = end_week
    mail(to: current_user.email, subject: "Payroll for week ending on #{end_week}" )
  end
  
end
