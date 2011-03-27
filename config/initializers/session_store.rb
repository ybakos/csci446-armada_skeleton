ActionController::Base.session = {
  :key         => '_app_session',
  :secret      => 'b2129cc2a201c311300ad14ca96424ccdd579539340105d8ca1527a01570a074cb526718811ad2a3e093fe02052d6828bd87afc6ff0a04a07c25d1c9043c2285'
}

ActionController::Base.session_store = :active_record_store
