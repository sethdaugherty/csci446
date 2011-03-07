# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_project06_session',
  :secret      => 'f1bd5ea712d333925c2452afcfefe67ee4bba39099b2e1ff6f470ed85bd0d69cbf114727f428b1ab19fb7986a92ac816a808196ecb7d8d8babb509bb29b6c195'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
