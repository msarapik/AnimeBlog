# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_AnimeBlog_session',
  :secret      => 'cd469ddf6d0f5500418852ec1f30ea4210bf4cbe90291378508357d9399bc7c804a60a6c85d302cd6ae564ad7d0278c8d49bd20efdcecff074072153bb716799'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
