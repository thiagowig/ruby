
#Rails.application.config.session_store :cookie_store, key: '_awesome_session', expire_after: 1.minute
Rails.application.config.session_store :active_record_store, key: '_auth_session', expire_after: 1.minute
