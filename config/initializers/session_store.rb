# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_slipknot_session',
  :secret      => '18708857ed724ab3c9701f2a8261088e6b3a4b05365fa52f397547b0ab54ae0d9655505cebe899c1d3f5b8264a20382f5325b7d6d52f1505f07292c38bf8921d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
