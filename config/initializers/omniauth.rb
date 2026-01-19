require 'omniauth-google-oauth2'

OmniAuth.config.allowed_request_methods = %i[get post]
OmniAuth.config.silence_get_warning = true