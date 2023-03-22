class UserService
  def unsubscribe(user_id: user_id)
    user = User.find_by_id(user_id)

    return { success: false, message: I18n.t('messages.unsubscribed.invalid_user') } unless user
    return { success: false, message: I18n.t('messages.unsubscribed.already_unsubscribed') } if user.unsubscribed?
    return { success: false, message: I18n.t('messages.unsubscribed.expired_unsubscription') } if expired_unsubscription?

    unsubscribe!
    return { success: true, message: I18n.t('messages.unsubscribed.unsubscribe_successfully') }
  end
end
