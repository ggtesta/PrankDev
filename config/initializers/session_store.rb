# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tcc_session',
  :secret      => '141e0c1d2769a2605ccf0f4a6973695b417385762d010b5fcdf9173409777af2e1c4edcd4311d16cc12146c5a7cb28f0dabdac941aa0beb6c1e471226b87938e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
