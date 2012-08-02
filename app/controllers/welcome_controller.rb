class WelcomeController < ApplicationController
  layout 'welcome'
  skip_before_filter :login_required
end