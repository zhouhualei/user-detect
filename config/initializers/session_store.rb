# Be sure to restart your server when you modify this file.

UserDetect::Application.config.session_store :active_record_store, key: '_user-detect_session'
ActionDispatch::Session::ActiveRecordStore.session_class = Session