# The Notification class is used as a proxy for sending mails
# (and possibly other kinds of messages).
#
# The idea behind the Notification class is that leihs could
# in principle keep "mailboxes" for users so that f.ex. upon
# login into leihs they could be able to see all the communications
# with the leihs system.
#
class Notification < ActiveRecord::Base

  belongs_to :user, inverse_of: :notifications

  default_scope { order(created_at: :desc) }

  def self.order_submitted(order, send_mail = false)
    o = Mailer::Order.submitted(order).deliver if send_mail
    title = (o.nil? ? _('Order submitted') : o.subject)
    Notification.create(user: order.target_user, title: title)
  end

  # Notify the person responsible for the inventory pool that an order
  # was received. Can be enabled in config/environment.rb
  def self.order_received(order, send_mail = false)
    Mailer::Order.received(order).deliver if (send_mail and Setting.deliver_order_notifications)
  end
  
  def self.order_approved(order, comment, send_mail = true, current_user = nil)
    o = Mailer::Order.approved(order, comment).deliver if send_mail
    title = (o.nil? ? _('Order approved') : o.subject)
    Notification.create(user: order.target_user, title: title)
  end
  
  def self.order_rejected(order, comment, send_mail = true, current_user = nil)
    o = Mailer::Order.rejected(order, comment).deliver if send_mail
    title = (o.nil? ? _('Order rejected') : o.subject)
    Notification.create(user: order.target_user, title: title)
  end

  def self.deadline_soon_reminder(user, reservations, send_mail = true)
    reservations.map(&:inventory_pool).uniq.each do |inventory_pool|
      o = Mailer::User.deadline_soon_reminder(user, inventory_pool, reservations).deliver if send_mail
      title = (o.nil? ? _('Deadline soon') : o.subject)
      Notification.create(user: user, title: title)
    end
  end
  
  
  def self.remind_user(user, reservations, send_mail = true)
    reservations.map(&:inventory_pool).uniq.each do |inventory_pool|
      o = Mailer::User.remind(user, inventory_pool, reservations).deliver if send_mail
      title = (o.nil? ? _('Reminder') : o.subject)
      Notification.create(user: user, title: title)
    end
  end

  def self.user_email(from, to, subject, body)
    Mailer::User.email(from, to, subject, body).deliver
    # we currently do *not* log emails to users
  end
  
end

