# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twittilate_session',
  :secret      => 'a002bacd5c1dcd44474eac1e734f4f63fa2685cc38d4d9d90b5d4bfb0bc7ca99ef01f741af10a7ca75899be4724689d8edbbf64f0183770545b23543f38f0c27'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
