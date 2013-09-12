Dusttrak::App.helpers do
  def authenticate_or_request_with_http_basic(realm = 'Dusttrak')
    authenticate_with_http_basic || request_http_basic_authentication(realm)
  end

  def authenticate_with_http_basic
    if auth_str = request.env['HTTP_AUTHORIZATION']
      Usuario.autenticar! *Base64.decode64(auth_str.sub(/^Basic\s+/, '')).split(':')
    end
  end

  def request_http_basic_authentication(realm = 'Dusttrak')
    response.headers["WWW-Authenticate"] = %(Basic realm="#{realm}")
    response.body = "HTTP Basic: Access denied.\n"
    response.status = 401
    return false
  end
end
