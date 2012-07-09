class WelcomeController < ApplicationController
  layout :nil
  skip_before_filter :login_required
end