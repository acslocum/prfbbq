# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prfbbq_session',
  :secret      => 'db9eee9713dcf1e0c9faa0256b882259e9e442be231397e513eb84397b1e65096a134faf3259f41eacd7ca9b119a2503f24c68b09da43facc67f84e4bf0f259a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
