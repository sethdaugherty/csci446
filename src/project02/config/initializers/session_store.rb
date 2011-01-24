# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_project02_session',
  :secret      => 'c42be9f5104b24f35adeb0833b03d841e6d53478467cb8d9e96089a2ecd99255aa856ad62c30454f87fe12e0c3623eb46d62c2ec20056d5565c77bbc95c68ea8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
