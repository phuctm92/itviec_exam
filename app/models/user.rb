# == Schema Information
#
# Table name: users
#
#  id                     : integer          not null, primary key
#  subscription_status    : string
#  unsubscribe_sent_at   : datetime
#

class User < ApplicationRecord
  # active: 1 => Active subscription.
  # inactive: 2 => Deleted subscription.
  enum subscription_status: { active: 1, inactive: 2 }

  def unsubscribe!
    update!(subscription_status: :inactive)
  end

  def unsubscribed?
    inactive?
  end

  def expired_unsubscription?
    Time.current > unsubscribe_sent_at.next_day(3)
  end
end
